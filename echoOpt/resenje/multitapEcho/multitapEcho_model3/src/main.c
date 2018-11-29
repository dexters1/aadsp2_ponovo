/////////////////////////////////////////////////////////////////////////////////
// @file main.cpp
//
// Module: multitapEchoDSP
// Description:  Add multitap echo to input signal
// $Source: $
// $Revision: 1.0 $
// $Date: <date> $
// $Author: <student name> $
//
/////////////////////////////////////////////////////////////////////////////////
#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include <common.h>
#include <circbuff.h>

extern void multitap_echo(__memY DSPfract *pInbuf, __memY DSPfract *pOutbuf);

/////////////////////////////////////////////////////////////////////////////////
// IO buffers
/////////////////////////////////////////////////////////////////////////////////
__memY DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Control state structure
/////////////////////////////////////////////////////////////////////////////////
typedef struct  
{
	__memX DSPfract* pEchoBuff;
	DSPint bufferLength;
	__memX DSPfract* writePointer;
	__memX DSPfract* readPointer[N_TAP];
	DSPint delay[N_TAP];
	DSPfract input_gain;
	__memY DSPfract* tap_gain;
	DSPint n_tap;
} EchoState;


/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Multitap delay state and initialization constants
/////////////////////////////////////////////////////////////////////////////////
EchoState echoState;
__memY DSPfract tap_gain_ymem[N_TAP];
__memX DSPfract __attribute__((__aligned__(4096))) echo_buffer[ECHO_MAX_LENGTH];
__memX const DSPint initial_delay[N_TAP] = {1024, 1536, 2560, 3072};
__memX const DSPfract initial_gain[N_TAP] = {FRACT_NUM(0.25), FRACT_NUM(0.125), FRACT_NUM(0.0625), FRACT_NUM(0.0625)};
__memX const DSPfract initial_input_gain = FRACT_NUM(0.5);
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// @Author	<student name>
// @Date		<date>  
//
// Function:
// multitap_echo_init
//
// @param - nothing
//
// @return - nothing
// Comment: Initialize echoState structure
//
// E-mail:	<email>
//
/////////////////////////////////////////////////////////////////////////////////
void multitap_echo_init()
{
	DSPint i;
	__memX DSPfract* pInitEchoBuffer = echo_buffer;

	__memX DSPint* pDelay = echoState.delay;
	__memX const DSPint* pInitDelay = initial_delay;
	__memY DSPfract* pGain;
	__memX const DSPfract* pInitGain = initial_gain;
	__memX DSPfract* __memX * readPtrPtr = echoState.readPointer;
	__memX DSPfract* readPtrOffset = pInitEchoBuffer + ECHO_MAX_LENGTH - 1;

	for (i=0; i<ECHO_MAX_LENGTH; i++)
	{
		*pInitEchoBuffer++ = FRACT_NUM(0.0);
	}

	echoState.tap_gain = tap_gain_ymem;
	echoState.pEchoBuff = echo_buffer;
	echoState.bufferLength = ECHO_MAX_LENGTH;
	echoState.writePointer = echoState.pEchoBuff + ECHO_MAX_LENGTH-1;
	echoState.input_gain = FRACT_NUM(0.5);
	echoState.n_tap = N_TAP;
	pGain = echoState.tap_gain;
	for(i = 0; i< N_TAP; i++)
	{
		*readPtrPtr++ = readPtrOffset - *pInitDelay;
		*pDelay++ = *pInitDelay++;
		*pGain++ = *pInitGain++;
	}
}

/////////////////////////////////////////////////////////////////////////////////
// @Author	<student name>
// @Date		<date>  
//
// Function:
// multitap_echo
//
// @param - pInbuf - Buffer with input samples
//		  - pOutbuf - Buffer with output samples
//
// @return - nothing
// Comment: Apply echo to input samples
//
// E-mail:	<email>
//
/////////////////////////////////////////////////////////////////////////////////
void multitap_echo1(__memY DSPfract *pInbuf, __memY DSPfract *pOutbuf)
{
	DSPint i, j;
	__memX DSPfract* writePtr = echoState.writePointer;
	DSPfract inputGain = echoState.input_gain;
	__memY DSPfract* pGain = echoState.tap_gain;
	__memX DSPfract* __memX* readPtrPtr = echoState.readPointer;

	for(i = 0; i < BLOCK_SIZE; i++)
	{
		DSPaccum outputSample =  *pInbuf * inputGain;


		*writePtr = *pInbuf++;
		writePtr = CIRC_INC(writePtr, MOD_4096+1);

		for(j = 0; j < echoState.n_tap; j++)
		{
			__memX DSPfract* readPtr = *readPtrPtr;
			outputSample +=  *pGain++ * *readPtr;
			*readPtrPtr = CIRC_INC(readPtr, MOD_4096+1);;
			readPtrPtr++;
		}

		pGain -= N_TAP;
        readPtrPtr -= N_TAP;

		*pOutbuf++ = outputSample;
	}

	 echoState.writePointer = writePtr;
}
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// @Author    <student name>
// @Date        <date>  
//
// Function:
// main
//
// @param - nothing
// @return - nothing
// Comment: main routine of a program
//
/////////////////////////////////////////////////////////////////////////////////

int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;

	char WavInputName[256];
	char WavOutputName[256];

    int nChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;

	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,"../../TestStreams/speech.wav");
	wav_in = cl_wavread_open(WavInputName);
	if(wav_in == NULL)
    {
        printf("Error: Could not open input wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	nChannels = cl_wavread_getnchannels(wav_in);
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------

	// Open output wav file
	//-------------------------------------------------
	strcpy(WavOutputName,"../OutStreams/out_speech_3.wav");
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, nChannels, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open output wavefile.\n");
        return -1;
    }
	//-------------------------------------------------

	
	// Initialize echo 
	//-------------------------------------------------
	multitap_echo_init();
	//-------------------------------------------------
	
	
	// Processing loop
	//-------------------------------------------------
    {
		int i;
		int j;
		int k;
		int sample;
		int bound = iNumSamples/BLOCK_SIZE;

		for(i=0; i< bound; i++)
		{
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{
					sample = cl_wavread_recvsample(wav_in);
					sampleBuffer[k][j] = rbits(sample);
				}
			}

			// Do processing...
			// Your code here...
			// Initialize echo
			//-------------------------------------------------
			multitap_echo(sampleBuffer[0], sampleBuffer[0]);
			//-------------------------------------------------

			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{
					sample = bitsr(sampleBuffer[k][j]);
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}
		}
	}

	// Close files
	//-------------------------------------------------
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);
	//-------------------------------------------------

    return 0;
 }

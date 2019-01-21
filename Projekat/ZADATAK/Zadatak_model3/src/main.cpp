#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include <common.h>
#include "compressor.h"
#include "processing.h"

__memY DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
__memX DSPint input_gain;
__memX DSPint headroom_gain;
__memX ProcessingState processingState;

int main(int argc, char *argv[])
 {

    WAVREAD_HANDLE * wav_in;
    WAVWRITE_HANDLE * wav_out;

	char WavInputName[256];
	char WavOutputName[256];

    int nChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;
    DSPint ret;


    //MODE2_0_0, MODE3_2_0, MODE3_2_1
    //-------------------------------------------------

	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName, argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	if(wav_in == NULL)
    {
        printf("Error2: Could not open input wavefile %s.\n", WavInputName);
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
	strcpy(WavOutputName, argv[1]);
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, 5, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open output wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	ret = processing_init("1", "a", "a", "as", 6);
	if (ret != SUCCESS)
		return -1;
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
			//-------------------------------------------------
			if(processingState.enable)
						processing(sampleBuffer, sampleBuffer);
			//-------------------------------------------------

			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<5; k++)
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

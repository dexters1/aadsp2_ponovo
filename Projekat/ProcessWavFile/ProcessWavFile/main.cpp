/////////////////////////////////////////////////////////////////////////////////
//
// @file main.cpp
//
// Module: multitapEcho
// Description:  Add multitap echo to input signal
// $Source: $
// $Revision: 1.0 $
// $Date: <date> $
// $Author: <student name> $
//
/////////////////////////////////////////////////////////////////////////////////
#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"
#include "common.h"
#include "tremolo1.h"
#include <math.h>

/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// IO buffers
/////////////////////////////////////////////////////////////////////////////////
double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Control state structure
/////////////////////////////////////////////////////////////////////////////////
typedef struct  
{
	double input_gain;
	bool mode;
	bool enable;
} ProcessingState;

ProcessingState processingState;

/////////////////////////////////////////////////////////////////////////////////


/////////////////////////////////////////////////////////////////////////////////
// @Author	<student name>
// @Date		<date>  
//
// Function:
// multitap_echo_init
//
// @param - echoState - Control state structure
//		  - buffer - buffer for keeping delayed samples
//		  - echoBufLen - Length of buffer
//		  - delay - array containing delay values in number of samples
//		  - input_gain - gain to be applayed to input sample
//		  - tap_gain - array of gains to be applayed to each delayed sample
//		  - n_tap - number of taps (equals length of delay and tap_gain)
//
// @return - nothing
// Comment: Initialize echoState structure
//
// E-mail:	<email>
//
/////////////////////////////////////////////////////////////////////////////////
void gainConverter()
{
	if(processingState.input_gain > 0)
	{
		processingState.input_gain = 0;
	}
	processingState.input_gain = pow(10.0, (processingState.input_gain/20.0));
	
}


void processing_init()
{
	init();
	gainConverter(); //iz db u linearno

	return;
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
//		  - inputLen - Length of input and output buffer
//		  - echoState - Control state structure
//
// @return - nothing
// Comment: Apply echo to input samples
//
// E-mail:	<email>
//
/////////////////////////////////////////////////////////////////////////////////
void processing_S(double* pInbuf, double* pOutbuf)  //ulazni buffer mnozi sa gainom datim i ide na izlaz
{
	double *in = pInbuf;
	double *out = pOutbuf;

	for( int i = 0; i < BLOCK_SIZE; i++)
	{
		
		(*out) =  (*in) * processingState.input_gain;
		in++;
		out++;
	}
}


void processing(double pInbuf[MAX_NUM_CHANNEL][BLOCK_SIZE], double pOutbuf[MAX_NUM_CHANNEL][BLOCK_SIZE]) // da bude matrica !!! void ins (int (*matrix)[SIZE], int row, int column);
{
	//sve mnozim sa gainom
	processing_S(pInbuf[0], pOutbuf[0]);//L Je l' saljem pInbuf[1] ili pInbuf+BLOCK_SIZE?
	processing_S(pInbuf[2], pOutbuf[2]);//R
	processing_S(pInbuf[3], pOutbuf[3]);//Ls
	processing_S(pInbuf[4], pOutbuf[4]);//Rs
	
	if (processingState.mode - 1 == 0) //ako mode 1 prolaze oni koji treba jos i kroz tremolo
	{
		processBlock(pInbuf[0], pOutbuf[0]); //Je l' treba Tremolo1 funkcije da editujem? Da izbacim promenljive iz poziva funkcija?
		processBlock(pInbuf[2], pOutbuf[2]);
	}

}


/////////////////////////////////////////////////////////////////////////////////
// @Author	<student name>
// @Date		<date>  
//
// Function:
// main
//
// @param - argv[0] - Input file name
//        - argv[1] - Output file name
// @return - nothing
// Comment: main routine of a program
//
// E-mail:	<email>
//
/////////////////////////////////////////////////////////////////////////////////
int main(int argc, char* argv[])
{
	FILE *wav_in=NULL;
	FILE *wav_out=NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr,outputWAVhdr;	
	
	// Init channel buffers
	for(int i=0; i<MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i],0,BLOCK_SIZE);

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName,argv[1]);
	wav_in = OpenWavFileForRead (WavInputName,"rb");
	strcpy(WavOutputName,argv[2]);
	wav_out = OpenWavFileForRead (WavOutputName,"wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in,inputWAVhdr);
	//-------------------------------------------------
	
	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = inputWAVhdr.fmt.NumChannels; // change number of channels
	//outputWAVhdr.fmt.NumChannels = 4;

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);

	if(argc - 6 > 0)
	{
		printf("Too many arguments in fucntion call");
		return 0;
	}
	else if(argc - 3 < 0)
	{
		printf("Too few arguments in fucntion call");
		return 0;
	}

	if(argc - 6 == 0)
	{
		processingState.enable = atoi(argv[3])?1:0;
		processingState.input_gain = atoi(argv[4]);
		processingState.mode = atoi(argv[5])?1:0;
	}
	else
	{
		if(argc - 5 == 0)
		{
			processingState.mode = 0;
			processingState.enable = atoi(argv[3])?1:0;
			processingState.input_gain = atof(argv[4]);
		}
		else
		{
			if(argc - 4 == 0)
			{
				processingState.mode = 0;
				processingState.enable = atoi(argv[3])?1:0;
				processingState.input_gain = -3;
			}
			else
			{
				processingState.mode = 0;
				processingState.input_gain = -3;
				processingState.enable = 1;
			}
		}
	}
	

	
	// Initialize process
	processing_init();

	if(!processingState.enable)
	{
		printf("Processing isn't enabled, exiting program");
		return 0;
	}
    

	// Processing loop
	//-------------------------------------------------	
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample/8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size/(inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample/8);
		
		// exact file length should be handled correctly...
		for(int i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	
			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<inputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				}
			}
			
		
			processing(sampleBuffer, sampleBuffer); //prosledjujem samo jedan element matrice, ne treba pokazivac, vec moram citavu matricu
			
			
			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<outputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = sampleBuffer[k][j] * SAMPLE_SCALE ;	// crude, non-rounding 			
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);		
				}
			}		
		}
	}
	
	
	// Close files
	//-------------------------------------------------	
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------	

	return 0;
}
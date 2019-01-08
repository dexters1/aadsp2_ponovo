#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "WAVheader.h"
#include "common.h"
#include "compressor.h"


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
	double headroom_gain;
	char* output_mode;
	bool enable;
} ProcessingState;

AudioCompressor_t compressor;
ProcessingState processingState;

/////////////////////////////////////////////////////////////////////////////////

void gainConverter()
{
	if(processingState.input_gain > 0)
	{
		processingState.input_gain = 0;
	}
	processingState.input_gain = pow(10.0, (processingState.input_gain/20.0));

	if (processingState.headroom_gain > 0)
	{
		processingState.headroom_gain = 0;
	}
	processingState.headroom_gain = pow(10.0, (processingState.headroom_gain / 20.0));
	
}


void processing_init()
{
	audio_compressor_init(&compressor); //init za kompresor
	gainConverter(); //iz db u linearno

	return;
}


void processing_input_gain(double* pInbuf, double* pOutbuf)  
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

void processing_headroom_gain(double* pInbuf, double* pOutbuf)
{
	double *in = pInbuf;
	double *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * processingState.headroom_gain;
		in++;
		out++;
	}
}

void processing_gain_negative_2(double* pInbuf, double* pOutbuf)
{
	double *in = pInbuf;
	double *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * 0.794328235;
		in++;
		out++;
	}
}

void processing_gain_negative_6(double* pInbuf, double* pOutbuf)
{
	double *in = pInbuf;
	double *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * 0.501187234;
		in++;
		out++;
	}
}


void processing_sum(double* pInbuf1, double* pInbuf2, double* pOutbuf)  
{
	double *in1 = pInbuf1;
	double *in2 = pInbuf2;
	double *out = pOutbuf;

	for( int i = 0; i < BLOCK_SIZE; i++)
	{
		
		(*out) =  (*in1) + (*in2);
		in1++;
		in2++;
		out++;
	}
}

void processing_copy(double* pInbuf, double* pOutbuf)
{
	double *in = pInbuf;
	double *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in);
		in++;
		out++;
	}
}

void processing_empty(double* pOutbuf)
{
	double *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = 0;
		out++;
	}
}


void processing(double pInbuf[MAX_NUM_CHANNEL][BLOCK_SIZE], double pOutbuf[MAX_NUM_CHANNEL][BLOCK_SIZE])
{
	//sve mnozim sa gainom
	processing_input_gain(pInbuf[0], pOutbuf[0]);//L input_gain
	processing_input_gain(pInbuf[1], pOutbuf[1]);//R input_gain

	processing_sum(pInbuf[0], pInbuf[1], pOutbuf[2]);//Centralni buffer suma
	processing_headroom_gain(pInbuf[2], pOutbuf[2]);//Centralni buffer headroom gain

	if ((strcmp(processingState.output_mode, "3_2_0") != 0) || (strcmp(processingState.output_mode, "0_2_0") != 0))
	{
		processing_copy(pInbuf[0], pOutbuf[3]);//Ls kopira L buffer posle input_gain-a
		processing_copy(pInbuf[1], pOutbuf[4]);//Rs kopira R buffer posle input_gain-a
	}

	processing_gain_negative_6(pInbuf[2],pOutbuf[0]); //L izlaz -6 gain
	processing_gain_negative_6(pInbuf[2], pOutbuf[1]); //R izlaz -6 gain //DA LI MOGU SAMO JEDAN BUFFER DA IZRACUNAM PA DA OBA POKAZUJU NA ISTI?


	
	if (strcmp(processingState.output_mode, "3_2_0") == 0)
	{
		gst_audio_dynamic_transform_compressor(&compressor, pOutbuf[3], BLOCK_SIZE); // Ls kroz komrpesor
		gst_audio_dynamic_transform_compressor(&compressor, pOutbuf[4], BLOCK_SIZE); // Rs kroz kompresor


		processing_gain_negative_2(pInbuf[3], pOutbuf[3]); //Ls -2 gain
		processing_gain_negative_2(pInbuf[4], pOutbuf[4]); // Rs -2 gain

		processing_sum(pInbuf[0], pInbuf[3], pOutbuf[3]); // sumira se L i Ls posle kompres gain-a za Ls izlaz
		processing_sum(pInbuf[1], pInbuf[4], pOutbuf[4]); // sumira se R i Rs posle kompres gain-a za Rs izlaz
	}
	else if (strcmp(processingState.output_mode, "0_2_0") == 0)
	{
		gst_audio_dynamic_transform_compressor(&compressor, pOutbuf[3], BLOCK_SIZE); // Ls kroz komrpesor
		gst_audio_dynamic_transform_compressor(&compressor, pOutbuf[4], BLOCK_SIZE); // Rs kroz kompresor


		processing_gain_negative_2(pInbuf[3], pOutbuf[3]); //Ls -2 gain
		processing_gain_negative_2(pInbuf[4], pOutbuf[4]); // Rs -2 gain

		processing_sum(pInbuf[0], pInbuf[3], pOutbuf[3]); // sumira se L i Ls posle kompres gain-a za Ls izlaz
		processing_sum(pInbuf[1], pInbuf[4], pOutbuf[4]); // sumira se R i Rs posle kompres gain-a za Rs izlaz

		/*memset(&pOutbuf[2], 0, BLOCK_SIZE); //buffere koje ne koristimo namestimo na 0
		memset(&pOutbuf[0], 0, BLOCK_SIZE);
		memset(&pOutbuf[1], 0, BLOCK_SIZE);*/
		processing_empty(pOutbuf[0]);
		processing_empty(pOutbuf[1]);
		processing_empty(pOutbuf[2]);
	}
	else
	{
		/*memset(&pOutbuf[2], 0, BLOCK_SIZE); //buffere koje ne koristimo namestimo na 0
		memset(&pOutbuf[3], 0, BLOCK_SIZE);
		memset(&pOutbuf[4], 0, BLOCK_SIZE);*/

		processing_empty(pOutbuf[2]);
		processing_empty(pOutbuf[3]);
		processing_empty(pOutbuf[4]);
	}

	

}

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
	//outputWAVhdr.fmt.NumChannels = inputWAVhdr.fmt.NumChannels; // change number of channels
	outputWAVhdr.fmt.NumChannels = 5; 

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);

	if(argc - 7 > 0)
	{
		printf("Too many arguments in fucntion call");
		return 0;
	}
	else if(argc - 3 < 0)
	{
		printf("Too few arguments in fucntion call");
		return 0;
	}

	if(argc - 7 == 0)
	{
		processingState.enable = atoi(argv[3])?1:0;
		processingState.input_gain = atoi(argv[4]);
		processingState.headroom_gain = atoi(argv[5]);
		processingState.output_mode = argv[6];
	}
	else
	{
		if(argc - 6 == 0)
		{
			processingState.output_mode = "2_0_0";
			processingState.enable = atoi(argv[3])?1:0;
			processingState.input_gain = atof(argv[4]);
			processingState.headroom_gain = atoi(argv[5]);
		}
		else
		{
			if(argc - 5 == 0)
			{
				processingState.output_mode = "2_0_0";
				processingState.headroom_gain = -3;
				processingState.enable = atoi(argv[3])?1:0;
				processingState.input_gain = atof(argv[4]);
			}
			else
			{
				if (argc - 4 == 0)
				{
					processingState.output_mode = "2_0_0";
					processingState.headroom_gain = -3;
					processingState.enable = atoi(argv[3]) ? 1 : 0;
					processingState.input_gain = -6;
				}
				else
				{
					processingState.output_mode = "2_0_0";
					processingState.enable = 1;
					processingState.input_gain = -6;
					processingState.headroom_gain = -3;
				}
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
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "WAVheader.h"
#include "common.h"
#include "tremolo1.h"
#include "stdfix_emu.h"
#include "fixed_point_math.h"


/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// IO buffers
/////////////////////////////////////////////////////////////////////////////////
DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
/////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////
// Control state structure
/////////////////////////////////////////////////////////////////////////////////
typedef struct  
{
	DSPfract input_gain; //bice frakt
	bool mode;
	bool enable;
} ProcessingState;

int input_gain;
ProcessingState processingState;

/////////////////////////////////////////////////////////////////////////////////

void gainConverter() //konvertuje gain iz db u linearno
{
	if(input_gain > 0)
	{
		input_gain = 0;
	}
	double input_gain_lin = pow(10.0, (input_gain/20.0));
	processingState.input_gain = FRACT_NUM(input_gain_lin);
	
}

enum ret_codes { SUCCESS, FAIL };

int processing_init(char* enable, char* gain, char* mode, int argc)
{
	init(); //init za tremolo
	
	if(argc - 6 > 0) //Sredjivanje argumenata komandne linije kao parametri funkcije
	{
		printf("Too many arguments in fucntion call");
		return FAIL;
	}
	else if(argc - 3 < 0)
	{
		printf("Too few arguments in fucntion call");
		return FAIL;
	}

	if(argc - 6 == 0)
	{
		processingState.enable = atoi(enable)?1:0;
		input_gain = atoi(gain);
		processingState.mode = atoi(mode)?1:0;
	}
	else
	{
		if(argc - 5 == 0)
		{
			processingState.mode = 0;
			processingState.enable = atoi(enable)?1:0;
			input_gain = atoi(gain);
		}
		else
		{
			if(argc - 4 == 0)
			{
				processingState.mode = 0;
				processingState.enable = atoi(enable)?1:0;
				input_gain = -3;
			}
			else
			{
				processingState.mode = 0;
				input_gain = -3;
				processingState.enable = 1;
			}
		}
	}

	gainConverter();  //iz db u linearno

	return SUCCESS;
}


void processing_S(DSPfract* pInbuf, DSPfract* pOutbuf)  //Funkcija za gain
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for( int i = 0; i < BLOCK_SIZE; i++)
	{
		
		(*out) =  (*in) * processingState.input_gain;
		in++;
		out++;
	}
}

void processing_C(DSPfract* pInbuf, DSPfract* pOutbuf)  //Kopira Ulazni buffer u Izlazni buffer
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for( int i = 0; i < BLOCK_SIZE; i++)
	{
		
		(*out) =  (*in);
		in++;
		out++;
	}
}


void processing(DSPfract pInbuf[MAX_NUM_CHANNEL][BLOCK_SIZE], DSPfract pOutbuf[MAX_NUM_CHANNEL][BLOCK_SIZE]) // da bude matrica !!! void ins (int (*matrix)[SIZE], int row, int column);
{
	//sve mnozim sa gainom
	processing_S(pInbuf[0], pOutbuf[0]);//L 
	processing_S(pInbuf[1], pOutbuf[1]);//R
	processing_C(pInbuf[0], pOutbuf[2]);//Ls kanal
	processing_C(pInbuf[1], pOutbuf[3]);//Rs kanal
	
	if (processingState.mode - 1 == 0) //ako mode 1 prolaze oni koji treba jos i kroz tremolo
	{
		processBlock(pInbuf[0], pOutbuf[0]); 
		processBlock(pInbuf[1], pOutbuf[1]);
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
	outputWAVhdr.fmt.NumChannels = 4; //4 jer trazi L R LS i RS buffer

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);
	
	// Initialize process


	int ret = processing_init(argv[3], argv[4], argv[5], argc);
	if (ret != SUCCESS)
		return -1;

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
			
		
			if(processingState.enable)
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
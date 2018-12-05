#include "tremolo1.h"
#include "processing.h"
#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>


void gainConverter() //konvertuje gain iz db u linearno
{

	if(input_gain > 0)
	{
		input_gain = 0;
	}

	//input_gain_lin = pow(10.0, (input_gain/20.0));
	//processingState.input_gain = FRACT_NUM(input_gain_lin);
	processingState.input_gain = FRACT_NUM(0.70794578438);
	
}



int processing_init(char enable, char gain, char mode, DSPint argc)
{
	init(); //init za tremolo


	processingState.mode = mode;
	processingState.enable = enable;

	gainConverter();  //iz db u linearno

	return SUCCESS;
}


void processing_S(DSPfract* pInbuf, DSPfract* pOutbuf)  //Funkcija za gain
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;
	int i;

	for( i = 0; i < BLOCK_SIZE; i++)
	{
		
		(*out) =  (*in) * processingState.input_gain; //Je l' se mnozi?
		in++;
		out++;
	}
}

void processing_C(DSPfract* pInbuf, DSPfract* pOutbuf)  //Kopira Ulazni buffer u Izlazni buffer
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;
	int i;

	for( i = 0; i < BLOCK_SIZE; i++)
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

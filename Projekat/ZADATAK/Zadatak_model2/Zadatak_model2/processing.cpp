#include "compressor.h"
#include "processing.h"


void gainConverter()
{
	if (input_gain > 0)
	{
		input_gain = 0;
	}
	double input_gain_lin = pow(10.0, (input_gain / 20.0));
	processingState.input_gain = FRACT_NUM(input_gain_lin);

	if (headroom_gain > 0)
	{
		headroom_gain = 0;
	}
	double headroom_gain_lin = pow(10.0, (headroom_gain / 20.0));
	processingState.headroom_gain = FRACT_NUM(headroom_gain_lin);

}

int processing_init(char* enable, char* input_gain_in, char* headroom_gain_in, char* mode, DSPint argc)
{
	audio_compressor_init(); //init za kompresor

	if (argc - 7 > 0)
	{
		printf("Too many arguments in fucntion call");
		return FAIL;
	}
	else if (argc - 3 < 0)
	{
		printf("Too few arguments in fucntion call");
		return FAIL;
	}

	if (argc - 7 == 0)
	{
		processingState.enable = atoi(enable) ? 1 : 0;
		input_gain = atof(input_gain_in);
		headroom_gain = atof(headroom_gain_in);
		processingState.output_mode = mode;
	}
	else
	{
		if (argc - 6 == 0)
		{
			processingState.output_mode = "2_0_0";
			processingState.enable = atoi(enable) ? 1 : 0;
			input_gain = atof(input_gain_in);
			headroom_gain = atof(headroom_gain_in);
		}
		else
		{
			if (argc - 5 == 0)
			{
				processingState.output_mode = "2_0_0";
				headroom_gain = -3;
				processingState.enable = atoi(enable) ? 1 : 0;
				input_gain = atof(input_gain_in);
			}
			else
			{
				if (argc - 4 == 0)
				{
					processingState.output_mode = "2_0_0";
					headroom_gain = -3;
					processingState.enable = atoi(enable) ? 1 : 0;
					input_gain = -6;
				}
				else
				{
					processingState.output_mode = "2_0_0";
					processingState.enable = 1;
					input_gain = -6;
					headroom_gain = -3;
				}
			}
		}
	}

	gainConverter();  //iz db u linearno

	return SUCCESS;
}


void processing_input_gain(DSPfract* pInbuf, DSPfract* pOutbuf)
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * processingState.input_gain;
		in++;
		out++;
	}
}

void processing_headroom_gain(DSPfract* pInbuf, DSPfract* pOutbuf)
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * processingState.headroom_gain;
		in++;
		out++;
	}
}

void processing_gain_negative_2(DSPfract* pInbuf, DSPfract* pOutbuf)
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * FRACT_NUM(0.794328235);
		in++;
		out++;
	}
}

void processing_gain_negative_6(DSPfract* pInbuf, DSPfract* pOutbuf)
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in) * FRACT_NUM(0.501187234);
		in++;
		out++;
	}
}


void processing_sum(DSPfract* pInbuf1, DSPfract* pInbuf2, DSPfract* pOutbuf)
{
	DSPfract *in1 = pInbuf1;
	DSPfract *in2 = pInbuf2;
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in1) + (*in2);
		in1++;
		in2++;
		out++;
	}
}

void processing_copy(DSPfract* pInbuf, DSPfract* pOutbuf)
{
	DSPfract *in = pInbuf;
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = (*in);
		in++;
		out++;
	}
}

void processing_empty(DSPfract* pOutbuf)
{
	DSPfract *out = pOutbuf;

	for (int i = 0; i < BLOCK_SIZE; i++)
	{

		(*out) = FRACT_NUM(0.0);
		out++;
	}
}


void processing(DSPfract pInbuf[MAX_NUM_CHANNEL][BLOCK_SIZE], DSPfract pOutbuf[MAX_NUM_CHANNEL][BLOCK_SIZE])
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

	processing_gain_negative_6(pInbuf[2], pOutbuf[0]); //L izlaz -6 gain
	processing_gain_negative_6(pInbuf[2], pOutbuf[1]); //R izlaz -6 gain //DA LI MOGU SAMO JEDAN BUFFER DA IZRACUNAM PA DA OBA POKAZUJU NA ISTI?



	if (strcmp(processingState.output_mode, "3_2_0") == 0)
	{
		gst_audio_dynamic_transform_compressor(pOutbuf[3]); // Ls kroz komrpesor
		gst_audio_dynamic_transform_compressor(pOutbuf[4]); // Rs kroz kompresor


		processing_gain_negative_2(pInbuf[3], pOutbuf[3]); //Ls -2 gain
		processing_gain_negative_2(pInbuf[4], pOutbuf[4]); // Rs -2 gain

		processing_sum(pInbuf[0], pInbuf[3], pOutbuf[3]); // sumira se L i Ls posle kompres gain-a za Ls izlaz
		processing_sum(pInbuf[1], pInbuf[4], pOutbuf[4]); // sumira se R i Rs posle kompres gain-a za Rs izlaz
	}
	else if (strcmp(processingState.output_mode, "0_2_0") == 0)
	{
		gst_audio_dynamic_transform_compressor(pOutbuf[3]); // Ls kroz komrpesor
		gst_audio_dynamic_transform_compressor(pOutbuf[4]); // Rs kroz kompresor


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
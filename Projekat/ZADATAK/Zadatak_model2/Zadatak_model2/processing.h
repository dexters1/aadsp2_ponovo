#include"common.h"
#include "stdfix_emu.h"
#include "fixed_point_math.h"


typedef struct
{
	DSPfract input_gain;
	DSPfract headroom_gain;
	char* output_mode;
	bool enable;
} ProcessingState;

enum ret_codes { SUCCESS, FAIL };

extern void gainConverter();
extern int processing_init(char* enable, char* input_gain_in, char* headroom_gain_in, char* mode, DSPint argc);
extern void processing_S(DSPfract* pInbuf, DSPfract* pOutbuf);
extern void processing_C(DSPfract* pInbuf, DSPfract* pOutbuf);
extern void processing(DSPfract pInbuf[MAX_NUM_CHANNEL][BLOCK_SIZE], DSPfract pOutbuf[MAX_NUM_CHANNEL][BLOCK_SIZE]);

extern DSPint input_gain;
extern DSPint headroom_gain;
extern ProcessingState processingState;
extern DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];


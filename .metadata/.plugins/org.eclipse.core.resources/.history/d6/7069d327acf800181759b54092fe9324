#ifndef TREMOLO1_H
#define TREMOLO1_H
#
#include "common.h"

#define PI 3.14159265358979323846


typedef enum

{
	kWaveformTriangle, kWaveformSquare
} wave_forms_t;

// Adjustable parameters:
typedef struct {
	DSPint numChannels;

	DSPfract LFO_frequency;  // LFO frequency (Hz)

	DSPfract depth;      // Depth of effect (0-1)

	wave_forms_t waveform;      // What shape should be used for the LFO

	DSPfract lfoPhase;

	DSPfract inverseSampleRate;

	DSPfract ph;
} tremolo_struct_t;

extern DSPfract lfo();
extern void init();
extern void processBlock(DSPfract* input, DSPfract* output);



#endif
#ifndef TREMOLO1_H
#define TREMOLO1_H

#include "common.h"

#define PI 3.14159265358979323846

typedef enum

{
	kWaveformTriangle, kWaveformSquare
} wave_forms_t;

// Adjustable parameters:
typedef struct {
	int numChannels;

	float LFO_frequency;  // LFO frequency (Hz)

	float depth;      // Depth of effect (0-1)

	wave_forms_t waveform;      // What shape should be used for the LFO

	float lfoPhase;

	float inverseSampleRate;

	float ph;
} tremolo_struct_t;

float lfo(float phase, wave_forms_t waveform);
extern void init(tremolo_struct_t * data);
extern void processBlock(double* input, double* output, tremolo_struct_t* data, int numSamples);




#endif
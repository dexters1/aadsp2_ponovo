#pragma once
#ifndef COMPRESSOR_H
#define COMPRESSOR_H
#include "common.h"

typedef struct __AudioCompressor {
	DSPfract threshold;
	DSPfract ratio;
} AudioCompressor_t;


extern void audio_compressor_init();
extern void gst_audio_dynamic_transform_compressor(DSPfract * data);

#endif
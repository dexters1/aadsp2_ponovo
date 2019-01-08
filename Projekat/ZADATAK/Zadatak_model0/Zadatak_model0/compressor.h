#pragma once
#ifndef COMPRESSOR_H
#define COMPRESSOR_H

typedef struct __AudioCompressor {
	double threshold;
	double ratio;
} AudioCompressor_t;


extern void audio_compressor_init(AudioCompressor_t * compressor);
extern void gst_audio_dynamic_transform_compressor(AudioCompressor_t * compressor, double * data, unsigned int num_samples);

#endif
/*
*
* This element can act as a dynamic range compressor. A compressor changes the
* amplitude of all samples above a specific threshold with a specific ratio. If
* soft-knee mode is selected the ratio is applied smoothly.
*
* parameters: ratio [0.0, 1.0)
*             threshold [0.0, 1.0)
*/
#include "compressor.h"
#include "common.h"

AudioCompressor_t compressor;

void audio_compressor_init() {
	compressor.ratio = FRACT_NUM(1.0);
	compressor.threshold = FRACT_NUM(0.0);
}

void gst_audio_dynamic_transform_compressor(DSPfract * data) {
	DSPfract val, threshold = compressor.threshold;
	DSPint i;

	/* Nothing to do for us if ratio == 1.0. */
	if (compressor.ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < BLOCK_SIZE; i++) {
		val = data[i];

		if (val > threshold) {
			val = threshold + (val - threshold) * compressor.ratio;
		}
		else if (val < -threshold) {
			val = (DSPfract)(-threshold + (val + threshold) * compressor.ratio);
		}
		data[i] = (DSPfract)val;
	}

}

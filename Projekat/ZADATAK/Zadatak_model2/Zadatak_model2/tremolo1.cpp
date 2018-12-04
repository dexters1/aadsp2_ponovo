/*

 This code accompanies the textbook:



 Digital Audio Effects: Theory, Implementation and Application

 Joshua D. Reiss and Andrew P. McPherson



 ---



 Tremolo: amplitude modulation using a low-frequency oscillator

 See textbook Chapter 5: Amplitude Modulation



 Code by Andrew McPherson, Brecht De Man and Joshua Reiss



 ---


 This program is free software: you can redistribute it and/or modify

 it under the terms of the GNU General Public License as published by

 the Free Software Foundation, either version 3 of the License, or

 (at your option) any later version.



 This program is distributed in the hope that it will be useful,

 but WITHOUT ANY WARRANTY; without even the implied warranty of

 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the

 GNU General Public License for more details.


 You should have received a copy of the GNU General Public License

 along with this program.  If not, see <http://www.gnu.org/licenses/>.

 */

#include <math.h>
#include "tremolo1.h"

//==============================================================================



float lfo(float phase, wave_forms_t waveform);
tremolo_struct_t data;

void init() {

	// Set default values:
	data.LFO_frequency = 2.0;
	data.depth = 1.0;
	data.waveform = kWaveformSquare;
	data.lfoPhase = 0.0;
	data.inverseSampleRate = 1.0 / SAMPLE_RATE;
	data.ph = data.lfoPhase;
}


void processBlock(DSPfract* input, DSPfract* output) {



	// Make a temporary copy of any state variables which need to be
	// maintained between calls to processBlock(). Each channel needs to be processed identically
	// which means that the activity of processing one channel can't affect the state variable for
	// the next channel.


	DSPfract *in = input;
	DSPfract *out = output;

	data.ph = data.lfoPhase;

	for (DSPint i = 0; i < BLOCK_SIZE; ++i)
	{
		

		// Ring modulation is easy! Just multiply the waveform by a periodic carrier

		(*out) = (*in) * (DSPfract)(1.0f - data.depth * lfo()); //toLong??? SAMO 1 da mi bude je worst case scenario

		// Update the carrier and LFO phases, keeping them in the range 0-1
		data.ph += data.LFO_frequency * data.inverseSampleRate; // Gde je korisceno se mnozi sa 2
		if (data.ph >= 1.0)
			data.ph -= 1.0;

		out++;
		in++;
	}

	// Having made a local copy of the state variables for each channel, now transfer the result
	// back to the main state variable so they will be preserved for the next call of processBlock()
	data.lfoPhase = data.ph;
}

//==============================================================================// 

float lfo()
{
	switch (data.waveform)
	{
	case kWaveformTriangle:
		if (data.ph < 0.25f)
			return 0.5f + 2.0f * data.ph;
		else if (data.ph <  0.75f)
			return 1.0f - 2.0f * (data.ph - 0.25f);
		else
			return 2.0f * (data.ph - 0.75f);

	case kWaveformSquare:
		if (data.ph <  0.5f)
			return 1.0f;
		else
			return 0.0f;
	default:
		return 1.0;
	}
}

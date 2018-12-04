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
	data.LFO_frequency = FRACT_NUM(2.0/4);
	data.depth = FRACT_NUM(1.0/2);
	data.waveform = kWaveformSquare;
	data.lfoPhase = FRACT_NUM(0.0);
	data.inverseSampleRate = FRACT_NUM(1.0 / SAMPLE_RATE);
	data.ph = data.lfoPhase;
}

DSPint g_lfo_scale = 1;
DSPint g_data_ph_scale = 1;

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

		(*out) = (*in) * (DSPfract)(FRACT_NUM(1.0f/2) - data.depth * lfo()*g_lfo_scale/*I ovde treba da siftuje*/)*2; //toLong??? SAMO 1 da mi bude je worst case scenario

		// Update the carrier and LFO phases, keeping them in the range 0-1
		data.ph = data.ph + data.LFO_frequency * data.inverseSampleRate*4; // Je l' se mnozi sa 4 jer koristi frequency?
		if (data.ph >= FRACT_NUM(1.0/2))
			data.ph = data.ph - FRACT_NUM(1.0/2)<<2;

		out++;
		in++;
	}

	// Having made a local copy of the state variables for each channel, now transfer the result
	// back to the main state variable so they will be preserved for the next call of processBlock()
	data.lfoPhase = data.ph;
}

//==============================================================================// 

DSPfract lfo()
{
	switch (data.waveform)
	{
	case kWaveformTriangle:
		if (data.ph < FRACT_NUM(0.25f))
		{
			g_lfo_scale = 4;
			return FRACT_NUM(0.5f) + FRACT_NUM(2.0f/4) * data.ph; //da li data ph menja fz
		}
		else if (data.ph <  FRACT_NUM(0.75f))
		{
			g_lfo_scale = 8;
			return FRACT_NUM(1.0f/2) - FRACT_NUM(2.0f/4) * (data.ph - FRACT_NUM(0.25f)*(long)2/*ovde kad se mnozi ovaj nema skaliranje ovaj drugi ima*/); /*!!!!!!!DODAO SAM *2*/
		}
		else
		{
			g_lfo_scale = 2;
			return FRACT_NUM(2.0f/2) * (data.ph - FRACT_NUM(0.75f));
		}

	case kWaveformSquare:
		if (data.ph <  FRACT_NUM(0.5f))
		{
			g_lfo_scale = 2;
			return FRACT_NUM(1.0f/2);
		}
		else
		{
			return FRACT_NUM(0.0f);
		}
	default:
		g_lfo_scale = 2;
		return FRACT_NUM(1.0/2);
	}
}

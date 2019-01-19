	.extern _headroom_gain
	.extern _input_gain
	.extern _processingState
	.extern _sampleBuffer
	.extern _audio_compressor_init
	.public _gainConverter
	.extern _gst_audio_dynamic_transform_compressor
	.public _processing
	.public _processing_copy
	.public _processing_empty
	.public _processing_gain_negative_2
	.public _processing_gain_negative_6
	.public _processing_headroom_gain
	.public _processing_init
	.public _processing_input_gain
	.public _processing_sum
	.xdata_ovly
__extractedConst_0_1
	.dw  (0x4026e73e)
	.xdata_ovly
__extractedConst_1_1
	.dw  (0x65ac8c30)
	.xdata_ovly
__extractedConst_2_5
	.dw  (0x4026e73d)
	.xdata_ovly
__extractedConst_3_5
	.dw  (0x5a9df7ac)
	.code_ovly



_gainConverter:			/* LN: 5 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 5 | 
	i7 += 1			# LN: 5 | 
cline_5_0:			/* LN: 22 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_112)			# LN: 22 | 
__epilogue_112:			/* LN: 22 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 22 | 
	ret			# LN: 22 | 



_processing:			/* LN: 218 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 218 | 
	i7 += 1			# LN: 218 | 
	i7 = i7 + (0x2)			# LN: 218 | 
	i4 = i7 - (0x1)			# LN: 218 | 
	xmem[i4] = i0			# LN: 218 | 
	i0 = i7 - (0x2)			# LN: 218 | 
	xmem[i0] = i1			# LN: 218 | 
cline_218_0:			/* LN: 221 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 221 | 
	i0 = xmem[i0]			# LN: 221 | 
	i1 = i7 - (0x2)			# LN: 221 | 
	i1 = xmem[i1]			# LN: 221 | 
	call (_processing_input_gain)			# LN: 221 | 
cline_221_0:			/* LN: 222 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 222 | 
	i0 = xmem[i0]			# LN: 222 | 
	i1 = i7 - (0x2)			# LN: 222 | 
	i1 = xmem[i1]			# LN: 222 | 
	i0 = i0 + (0x10)			# LN: 222 | 
	i1 = i1 + (0x10)			# LN: 222 | 
	call (_processing_input_gain)			# LN: 222 | 
cline_222_0:			/* LN: 224 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 224 | 
	i0 = xmem[i0]			# LN: 224 | 
	i1 = i7 - (0x1)			# LN: 224 | 
	i1 = xmem[i1]			# LN: 224 | 
	i4 = i7 - (0x2)			# LN: 224 | 
	i4 = xmem[i4]			# LN: 224 | 
	i1 = i1 + (0x10)			# LN: 224 | 
	i4 = i4 + (0x20)			# LN: 224 | 
	call (_processing_sum)			# LN: 224 | 
cline_224_0:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 225 | 
	i0 = xmem[i0]			# LN: 225 | 
	i1 = i7 - (0x2)			# LN: 225 | 
	i1 = xmem[i1]			# LN: 225 | 
	i0 = i0 + (0x20)			# LN: 225 | 
	i1 = i1 + (0x20)			# LN: 225 | 
	call (_processing_headroom_gain)			# LN: 225 | 
cline_225_0:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processingState + 2]			# LN: 227 | 
	a0 & a0			# LN: 227 | 
	if (a == 0) jmp (cline_227_0)			# LN: 227 | 
	a0 = xmem[_processingState + 2]			# LN: 227 | 
	uhalfword(a1) = (0x1)			# LN: 227 | 
	a0 - a1			# LN: 227 | 
	if (a != 0) jmp (else_6)			# LN: 227 | 
cline_227_0:			/* LN: 229 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 229 | 
	i1 = i7 - (0x2)			# LN: 229 | 
	i1 = xmem[i1]			# LN: 229 | 
	i0 = xmem[i0]			# LN: 229 | 
	i1 = i1 + (0x30)			# LN: 229 | 
	call (_processing_copy)			# LN: 229 | 
cline_229_0:			/* LN: 230 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 230 | 
	i0 = xmem[i0]			# LN: 230 | 
	i1 = i7 - (0x2)			# LN: 230 | 
	i1 = xmem[i1]			# LN: 230 | 
	i0 = i0 + (0x10)			# LN: 230 | 
	i1 = i1 + (0x40)			# LN: 230 | 
	call (_processing_copy)			# LN: 230 | 
	jmp (endif_6)			# LN: 230 | 
cline_230_0:			/* LN: 233 | CYCLE: 0 | RULES: () */ 
endif_6:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
else_6:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 233 | 
	i0 = xmem[i0]			# LN: 233 | 
	i1 = i7 - (0x2)			# LN: 233 | 
	i1 = xmem[i1]			# LN: 233 | 
	i0 = i0 + (0x20)			# LN: 233 | 
	call (_processing_gain_negative_6)			# LN: 233 | 
cline_233_0:			/* LN: 234 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 234 | 
	i0 = xmem[i0]			# LN: 234 | 
	i1 = i7 - (0x2)			# LN: 234 | 
	i1 = xmem[i1]			# LN: 234 | 
	i0 = i0 + (0x20)			# LN: 234 | 
	i1 = i1 + (0x10)			# LN: 234 | 
	call (_processing_gain_negative_6)			# LN: 234 | 
cline_234_0:			/* LN: 238 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processingState + 2]			# LN: 238 | 
	a0 & a0			# LN: 238 | 
	if (a != 0) jmp (else_7)			# LN: 238 | 
cline_238_0:			/* LN: 240 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 240 | 
	i0 = xmem[i0]			# LN: 240 | 
	nop #empty cycle
	i0 = i0 + (0x30)			# LN: 240 | 
	call (_gst_audio_dynamic_transform_compressor)			# LN: 240 | 
cline_240_0:			/* LN: 241 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 241 | 
	i0 = xmem[i0]			# LN: 241 | 
	nop #empty cycle
	i0 = i0 + (0x40)			# LN: 241 | 
	call (_gst_audio_dynamic_transform_compressor)			# LN: 241 | 
cline_241_0:			/* LN: 244 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 244 | 
	i0 = xmem[i0]			# LN: 244 | 
	i1 = i7 - (0x2)			# LN: 244 | 
	i1 = xmem[i1]			# LN: 244 | 
	i0 = i0 + (0x30)			# LN: 244 | 
	i1 = i1 + (0x30)			# LN: 244 | 
	call (_processing_gain_negative_2)			# LN: 244 | 
cline_244_0:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 245 | 
	i0 = xmem[i0]			# LN: 245 | 
	i1 = i7 - (0x2)			# LN: 245 | 
	i1 = xmem[i1]			# LN: 245 | 
	i0 = i0 + (0x40)			# LN: 245 | 
	i1 = i1 + (0x40)			# LN: 245 | 
	call (_processing_gain_negative_2)			# LN: 245 | 
cline_245_0:			/* LN: 247 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 247 | 
	i0 = xmem[i0]			# LN: 247 | 
	i1 = i7 - (0x1)			# LN: 247 | 
	i1 = xmem[i1]			# LN: 247 | 
	i4 = i7 - (0x2)			# LN: 247 | 
	i4 = xmem[i4]			# LN: 247 | 
	i1 = i1 + (0x30)			# LN: 247 | 
	i4 = i4 + (0x30)			# LN: 247 | 
	call (_processing_sum)			# LN: 247 | 
cline_247_0:			/* LN: 248 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 248 | 
	i0 = xmem[i0]			# LN: 248 | 
	i1 = i7 - (0x1)			# LN: 248 | 
	i0 = i0 + (0x10)			# LN: 248 | 
	i1 = xmem[i1]			# LN: 248 | 
	i4 = i7 - (0x2)			# LN: 248 | 
	i4 = xmem[i4]			# LN: 248 | 
	i1 = i1 + (0x40)			# LN: 248 | 
	i4 = i4 + (0x40)			# LN: 248 | 
	call (_processing_sum)			# LN: 248 | 
	jmp (endif_7)			# LN: 248 | 
cline_248_0:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
else_7:			/* LN: 238 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processingState + 2]			# LN: 250 | 
	uhalfword(a1) = (0x1)			# LN: 250 | 
	a0 - a1			# LN: 250 | 
	if (a != 0) jmp (else_8)			# LN: 250 | 
cline_250_0:			/* LN: 252 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 252 | 
	i0 = xmem[i0]			# LN: 252 | 
	nop #empty cycle
	i0 = i0 + (0x30)			# LN: 252 | 
	call (_gst_audio_dynamic_transform_compressor)			# LN: 252 | 
cline_252_0:			/* LN: 253 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 253 | 
	i0 = xmem[i0]			# LN: 253 | 
	nop #empty cycle
	i0 = i0 + (0x40)			# LN: 253 | 
	call (_gst_audio_dynamic_transform_compressor)			# LN: 253 | 
cline_253_0:			/* LN: 256 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 256 | 
	i0 = xmem[i0]			# LN: 256 | 
	i1 = i7 - (0x2)			# LN: 256 | 
	i1 = xmem[i1]			# LN: 256 | 
	i0 = i0 + (0x30)			# LN: 256 | 
	i1 = i1 + (0x30)			# LN: 256 | 
	call (_processing_gain_negative_2)			# LN: 256 | 
cline_256_0:			/* LN: 257 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 257 | 
	i0 = xmem[i0]			# LN: 257 | 
	i1 = i7 - (0x2)			# LN: 257 | 
	i1 = xmem[i1]			# LN: 257 | 
	i0 = i0 + (0x40)			# LN: 257 | 
	i1 = i1 + (0x40)			# LN: 257 | 
	call (_processing_gain_negative_2)			# LN: 257 | 
cline_257_0:			/* LN: 259 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 259 | 
	i0 = xmem[i0]			# LN: 259 | 
	i1 = i7 - (0x1)			# LN: 259 | 
	i1 = xmem[i1]			# LN: 259 | 
	i4 = i7 - (0x2)			# LN: 259 | 
	i4 = xmem[i4]			# LN: 259 | 
	i1 = i1 + (0x30)			# LN: 259 | 
	i4 = i4 + (0x30)			# LN: 259 | 
	call (_processing_sum)			# LN: 259 | 
cline_259_0:			/* LN: 260 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 260 | 
	i0 = xmem[i0]			# LN: 260 | 
	i1 = i7 - (0x1)			# LN: 260 | 
	i0 = i0 + (0x10)			# LN: 260 | 
	i1 = xmem[i1]			# LN: 260 | 
	i4 = i7 - (0x2)			# LN: 260 | 
	i4 = xmem[i4]			# LN: 260 | 
	i1 = i1 + (0x40)			# LN: 260 | 
	i4 = i4 + (0x40)			# LN: 260 | 
	call (_processing_sum)			# LN: 260 | 
cline_260_0:			/* LN: 265 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 265 | 
	i0 = xmem[i0]			# LN: 265 | 
	call (_processing_empty)			# LN: 265 | 
cline_265_0:			/* LN: 266 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 266 | 
	i0 = xmem[i0]			# LN: 266 | 
	nop #empty cycle
	i0 = i0 + (0x10)			# LN: 266 | 
	call (_processing_empty)			# LN: 266 | 
cline_266_0:			/* LN: 267 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 267 | 
	i0 = xmem[i0]			# LN: 267 | 
	nop #empty cycle
	i0 = i0 + (0x20)			# LN: 267 | 
	call (_processing_empty)			# LN: 267 | 
	jmp (endif_8)			# LN: 267 | 
cline_267_0:			/* LN: 275 | CYCLE: 0 | RULES: () */ 
else_8:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 275 | 
	i0 = xmem[i0]			# LN: 275 | 
	nop #empty cycle
	i0 = i0 + (0x20)			# LN: 275 | 
	call (_processing_empty)			# LN: 275 | 
cline_275_0:			/* LN: 276 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 276 | 
	i0 = xmem[i0]			# LN: 276 | 
	nop #empty cycle
	i0 = i0 + (0x30)			# LN: 276 | 
	call (_processing_empty)			# LN: 276 | 
cline_276_0:			/* LN: 277 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 277 | 
	i0 = xmem[i0]			# LN: 277 | 
	nop #empty cycle
	i0 = i0 + (0x40)			# LN: 277 | 
	call (_processing_empty)			# LN: 277 | 
cline_277_0:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
endif_7:			/* LN: 238 | CYCLE: 0 | RULES: () */ 
endif_8:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_130)			# LN: 282 | 
__epilogue_130:			/* LN: 282 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x2)			# LN: 282 | 
	i7 -= 1			# LN: 282 | 
	ret			# LN: 282 | 



_processing_copy:			/* LN: 189 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 189 | 
	i7 += 1			# LN: 189 | 
	i7 = i7 + (0x5)			# LN: 189 | 
	i4 = i7 - (0x1)			# LN: 189 | 
	xmem[i4] = i0			# LN: 189 | 
	i0 = i7 - (0x2)			# LN: 189 | 
	xmem[i0] = i1			# LN: 189 | 
cline_189_0:			/* LN: 191 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 191 | 
	a0 = xmem[i0]			# LN: 191 | 
	i0 = i7 - (0x3)			# LN: 191 | 
	xmem[i0] = a0			# LN: 191 | 
cline_191_0:			/* LN: 192 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 192 | 
	a0 = xmem[i0]			# LN: 192 | 
	i0 = i7 - (0x4)			# LN: 192 | 
	xmem[i0] = a0			# LN: 192 | 
cline_192_0:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 195 | 
	a0 = 0			# LN: 195 | 
	xmem[i0] = a0h			# LN: 195 | 
	do (0x10), label_end_92			# LN: 195 | 
cline_195_0:			/* LN: 198 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 198 | 
	i0 = xmem[i0]			# LN: 198 | 
	i1 = i7 - (0x4)			# LN: 198 | 
	i1 = xmem[i1]			# LN: 198 | 
	a0 = xmem[i0]			# LN: 198 | 
	xmem[i1] = a0h			# LN: 198 | 
cline_198_0:			/* LN: 199 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 199 | 
	i0 = xmem[i0]			# LN: 199 | 
	i1 = i7 - (0x3)			# LN: 199 | 
	i0 += 1			# LN: 199 | 
	xmem[i1] = i0			# LN: 199 | 
cline_199_0:			/* LN: 200 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 200 | 
	i0 = xmem[i0]			# LN: 200 | 
	i1 = i7 - (0x4)			# LN: 200 | 
	i0 += 1			# LN: 200 | 
	xmem[i1] = i0			# LN: 200 | 
cline_200_0:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
init_latch_label_5:			/* LN: 201 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 195 | 
	a0 = xmem[i0]			# LN: 195 | 
	uhalfword(a1) = (0x1)			# LN: 195 | 
	a0 = a0 + a1			# LN: 195 | 
	i0 = i7 - (0x5)			# LN: 195 | 
label_end_92:			# LN: 195 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 195 | 
cline_195_1:			/* LN: 202 | CYCLE: 0 | RULES: () */ 
for_end_5:			/* LN: 195 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_126)			# LN: 202 | 
__epilogue_126:			/* LN: 202 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 202 | 
	i7 -= 1			# LN: 202 | 
	ret			# LN: 202 | 



_processing_empty:			/* LN: 204 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 204 | 
	i7 += 1			# LN: 204 | 
	i7 = i7 + (0x3)			# LN: 204 | 
	i1 = i7 - (0x1)			# LN: 204 | 
	xmem[i1] = i0			# LN: 204 | 
cline_204_0:			/* LN: 206 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 206 | 
	a0 = xmem[i0]			# LN: 206 | 
	i0 = i7 - (0x2)			# LN: 206 | 
	xmem[i0] = a0			# LN: 206 | 
cline_206_0:			/* LN: 209 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 209 | 
	a0 = 0			# LN: 209 | 
	xmem[i0] = a0h			# LN: 209 | 
	do (0x10), label_end_93			# LN: 209 | 
cline_209_0:			/* LN: 212 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 209 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 212 | 
	i0 = xmem[i0]			# LN: 212 | 
	a0 = 0			# LN: 212 | 
	xmem[i0] = a0h			# LN: 212 | 
cline_212_0:			/* LN: 213 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 213 | 
	i0 = xmem[i0]			# LN: 213 | 
	i1 = i7 - (0x2)			# LN: 213 | 
	i0 += 1			# LN: 213 | 
	xmem[i1] = i0			# LN: 213 | 
cline_213_0:			/* LN: 209 | CYCLE: 0 | RULES: () */ 
init_latch_label_6:			/* LN: 214 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 209 | 
	a0 = xmem[i0]			# LN: 209 | 
	uhalfword(a1) = (0x1)			# LN: 209 | 
	a0 = a0 + a1			# LN: 209 | 
	i0 = i7 - (0x3)			# LN: 209 | 
label_end_93:			# LN: 209 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 209 | 
cline_209_1:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 209 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_128)			# LN: 215 | 
__epilogue_128:			/* LN: 215 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x3)			# LN: 215 | 
	i7 -= 1			# LN: 215 | 
	ret			# LN: 215 | 



_processing_gain_negative_2:			/* LN: 141 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 141 | 
	i7 += 1			# LN: 141 | 
	i7 = i7 + (0x5)			# LN: 141 | 
	i4 = i7 - (0x1)			# LN: 141 | 
	xmem[i4] = i0			# LN: 141 | 
	i0 = i7 - (0x2)			# LN: 141 | 
	xmem[i0] = i1			# LN: 141 | 
cline_141_0:			/* LN: 143 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 143 | 
	a0 = xmem[i0]			# LN: 143 | 
	i0 = i7 - (0x3)			# LN: 143 | 
	xmem[i0] = a0			# LN: 143 | 
cline_143_0:			/* LN: 144 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 144 | 
	a0 = xmem[i0]			# LN: 144 | 
	i0 = i7 - (0x4)			# LN: 144 | 
	xmem[i0] = a0			# LN: 144 | 
cline_144_0:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 147 | 
	a0 = 0			# LN: 147 | 
	xmem[i0] = a0h			# LN: 147 | 
	do (0x10), label_end_97			# LN: 147 | 
cline_147_0:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
label_begin_97:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 150 | 
	i0 = xmem[i0]			# LN: 150 | 
	x0 = xmem[__extractedConst_1_1 + 0]			# LN: 150 | 
	x1 = xmem[i0]			# LN: 150 | 
	i0 = i7 - (0x4)			# LN: 150 | 
	i0 = xmem[i0]			# LN: 150 | 
	a0 = x1 * x0			# LN: 150 | 
	xmem[i0] = a0			# LN: 150 | 
cline_150_0:			/* LN: 151 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 151 | 
	i0 = xmem[i0]			# LN: 151 | 
	i1 = i7 - (0x3)			# LN: 151 | 
	i0 += 1			# LN: 151 | 
	xmem[i1] = i0			# LN: 151 | 
cline_151_0:			/* LN: 152 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 152 | 
	i0 = xmem[i0]			# LN: 152 | 
	i1 = i7 - (0x4)			# LN: 152 | 
	i0 += 1			# LN: 152 | 
	xmem[i1] = i0			# LN: 152 | 
cline_152_0:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 153 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 147 | 
	a0 = xmem[i0]			# LN: 147 | 
	uhalfword(a1) = (0x1)			# LN: 147 | 
	a0 = a0 + a1			# LN: 147 | 
	i0 = i7 - (0x5)			# LN: 147 | 
label_end_97:			# LN: 147 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 147 | 
cline_147_1:			/* LN: 154 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 147 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_120)			# LN: 154 | 
__epilogue_120:			/* LN: 154 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 154 | 
	i7 -= 1			# LN: 154 | 
	ret			# LN: 154 | 



_processing_gain_negative_6:			/* LN: 156 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 156 | 
	i7 += 1			# LN: 156 | 
	i7 = i7 + (0x5)			# LN: 156 | 
	i4 = i7 - (0x1)			# LN: 156 | 
	xmem[i4] = i0			# LN: 156 | 
	i0 = i7 - (0x2)			# LN: 156 | 
	xmem[i0] = i1			# LN: 156 | 
cline_156_0:			/* LN: 158 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 158 | 
	a0 = xmem[i0]			# LN: 158 | 
	i0 = i7 - (0x3)			# LN: 158 | 
	xmem[i0] = a0			# LN: 158 | 
cline_158_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 159 | 
	a0 = xmem[i0]			# LN: 159 | 
	i0 = i7 - (0x4)			# LN: 159 | 
	xmem[i0] = a0			# LN: 159 | 
cline_159_0:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 162 | 
	a0 = 0			# LN: 162 | 
	xmem[i0] = a0h			# LN: 162 | 
	do (0x10), label_end_96			# LN: 162 | 
cline_162_0:			/* LN: 165 | CYCLE: 0 | RULES: () */ 
label_begin_96:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 165 | 
	i0 = xmem[i0]			# LN: 165 | 
	x0 = xmem[__extractedConst_0_1 + 0]			# LN: 165 | 
	x1 = xmem[i0]			# LN: 165 | 
	i0 = i7 - (0x4)			# LN: 165 | 
	i0 = xmem[i0]			# LN: 165 | 
	a0 = x1 * x0			# LN: 165 | 
	xmem[i0] = a0			# LN: 165 | 
cline_165_0:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 166 | 
	i0 = xmem[i0]			# LN: 166 | 
	i1 = i7 - (0x3)			# LN: 166 | 
	i0 += 1			# LN: 166 | 
	xmem[i1] = i0			# LN: 166 | 
cline_166_0:			/* LN: 167 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 167 | 
	i0 = xmem[i0]			# LN: 167 | 
	i1 = i7 - (0x4)			# LN: 167 | 
	i0 += 1			# LN: 167 | 
	xmem[i1] = i0			# LN: 167 | 
cline_167_0:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 168 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 162 | 
	a0 = xmem[i0]			# LN: 162 | 
	uhalfword(a1) = (0x1)			# LN: 162 | 
	a0 = a0 + a1			# LN: 162 | 
	i0 = i7 - (0x5)			# LN: 162 | 
label_end_96:			# LN: 162 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 162 | 
cline_162_1:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_122)			# LN: 169 | 
__epilogue_122:			/* LN: 169 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 169 | 
	i7 -= 1			# LN: 169 | 
	ret			# LN: 169 | 



_processing_headroom_gain:			/* LN: 126 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 126 | 
	i7 += 1			# LN: 126 | 
	i7 = i7 + (0x5)			# LN: 126 | 
	i4 = i7 - (0x1)			# LN: 126 | 
	xmem[i4] = i0			# LN: 126 | 
	i0 = i7 - (0x2)			# LN: 126 | 
	xmem[i0] = i1			# LN: 126 | 
cline_126_0:			/* LN: 128 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 128 | 
	a0 = xmem[i0]			# LN: 128 | 
	i0 = i7 - (0x3)			# LN: 128 | 
	xmem[i0] = a0			# LN: 128 | 
cline_128_0:			/* LN: 129 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 129 | 
	a0 = xmem[i0]			# LN: 129 | 
	i0 = i7 - (0x4)			# LN: 129 | 
	xmem[i0] = a0			# LN: 129 | 
cline_129_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 132 | 
	a0 = 0			# LN: 132 | 
	xmem[i0] = a0h			# LN: 132 | 
	do (0x10), label_end_95			# LN: 132 | 
cline_132_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
label_begin_95:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 135 | 
	i0 = xmem[i0]			# LN: 135 | 
	x0 = xmem[_processingState + 1]			# LN: 135 | 
	x1 = xmem[i0]			# LN: 135 | 
	i0 = i7 - (0x4)			# LN: 135 | 
	i0 = xmem[i0]			# LN: 135 | 
	a0 = x1 * x0			# LN: 135 | 
	xmem[i0] = a0			# LN: 135 | 
cline_135_0:			/* LN: 136 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 136 | 
	i0 = xmem[i0]			# LN: 136 | 
	i1 = i7 - (0x3)			# LN: 136 | 
	i0 += 1			# LN: 136 | 
	xmem[i1] = i0			# LN: 136 | 
cline_136_0:			/* LN: 137 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 137 | 
	i0 = xmem[i0]			# LN: 137 | 
	i1 = i7 - (0x4)			# LN: 137 | 
	i0 += 1			# LN: 137 | 
	xmem[i1] = i0			# LN: 137 | 
cline_137_0:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 132 | 
	a0 = xmem[i0]			# LN: 132 | 
	uhalfword(a1) = (0x1)			# LN: 132 | 
	a0 = a0 + a1			# LN: 132 | 
	i0 = i7 - (0x5)			# LN: 132 | 
label_end_95:			# LN: 132 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 132 | 
cline_132_1:			/* LN: 139 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 132 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_118)			# LN: 139 | 
__epilogue_118:			/* LN: 139 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 139 | 
	i7 -= 1			# LN: 139 | 
	ret			# LN: 139 | 



_processing_init:			/* LN: 24 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 24 | 
	i7 += 1			# LN: 24 | 
	xmem[i7] = i2; i7 += 1			# LN: 24, 24 | 
	i7 = i7 + (0x5)			# LN: 24 | 
	i2 = i7 - (0x1)			# LN: 24 | 
	xmem[i2] = i0			# LN: 24 | 
	i0 = i7 - (0x2)			# LN: 24 | 
	xmem[i0] = i1			# LN: 24 | 
	i0 = i7 - (0x3)			# LN: 24 | 
	xmem[i0] = i4			# LN: 24 | 
	i0 = i7 - (0x4)			# LN: 24 | 
	xmem[i0] = i5			# LN: 24 | 
	i0 = i7 - (0x5)			# LN: 24 | 
	xmem[i0] = a0h			# LN: 24 | 
cline_24_0:			/* LN: 26 | CYCLE: 0 | RULES: () */ 
	call (_audio_compressor_init)			# LN: 26 | 
cline_26_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 28 | 
	a0 = xmem[i0]			# LN: 28 | 
	uhalfword(a1) = (0x7)			# LN: 28 | 
	a0 = a0 - a1			# LN: 28 | 
	if (a <= 0) jmp (else_0)			# LN: 28 | 
cline_28_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 31 | 
	jmp (__epilogue_114)			# LN: 31 | 
cline_31_0:			/* LN: 33 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 33 | 
	a0 = xmem[i0]			# LN: 33 | 
	uhalfword(a1) = (0x3)			# LN: 33 | 
	a0 = a0 - a1			# LN: 33 | 
	if (a >= 0) jmp (else_1)			# LN: 33 | 
cline_33_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 36 | 
	jmp (__epilogue_114)			# LN: 36 | 
cline_36_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 33 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 33 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 39 | 
	a0 = xmem[i0]			# LN: 39 | 
	uhalfword(a1) = (0x7)			# LN: 39 | 
	a0 = a0 - a1			# LN: 39 | 
	if (a != 0) jmp (else_2)			# LN: 39 | 
cline_39_0:			/* LN: 41 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 41 | 
	i0 = xmem[i0]			# LN: 41 | 
	uhalfword(a0) = (0x30)			# LN: 41 | 
	a1 = xmem[i0]			# LN: 41 | 
	a0 = a1 - a0			# LN: 41 | 
	xmem[_processingState + 3] = a0h			# LN: 41 | 
cline_41_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_2_5 + 0]			# LN: 42 | 
	xmem[_processingState + 0] = a0h			# LN: 42 | 
cline_42_0:			/* LN: 43 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_3_5 + 0]			# LN: 43 | 
	xmem[_processingState + 1] = a0h			# LN: 43 | 
cline_43_0:			/* LN: 44 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 44 | 
	xmem[_processingState + 2] = a0h			# LN: 44 | 
	jmp (endif_2)			# LN: 44 | 
cline_44_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 48 | 
	a0 = xmem[i0]			# LN: 48 | 
	uhalfword(a1) = (0x6)			# LN: 48 | 
	a0 = a0 - a1			# LN: 48 | 
	if (a != 0) jmp (else_3)			# LN: 48 | 
cline_48_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 56 | 
	i0 = xmem[i0]			# LN: 56 | 
	uhalfword(a0) = (0x30)			# LN: 56 | 
	a1 = xmem[i0]			# LN: 56 | 
	a0 = a1 - a0			# LN: 56 | 
	xmem[_processingState + 3] = a0h			# LN: 56 | 
cline_56_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_2_5 + 0]			# LN: 57 | 
	xmem[_processingState + 0] = a0h			# LN: 57 | 
cline_57_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_3_5 + 0]			# LN: 58 | 
	xmem[_processingState + 1] = a0h			# LN: 58 | 
cline_58_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 59 | 
	xmem[_processingState + 2] = a0h			# LN: 59 | 
	jmp (endif_3)			# LN: 59 | 
cline_59_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 63 | 
	a0 = xmem[i0]			# LN: 63 | 
	uhalfword(a1) = (0x5)			# LN: 63 | 
	a0 = a0 - a1			# LN: 63 | 
	if (a != 0) jmp (else_4)			# LN: 63 | 
cline_63_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 69 | 
	i0 = xmem[i0]			# LN: 69 | 
	uhalfword(a0) = (0x30)			# LN: 69 | 
	a1 = xmem[i0]			# LN: 69 | 
	a0 = a1 - a0			# LN: 69 | 
	xmem[_processingState + 3] = a0h			# LN: 69 | 
cline_69_0:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_2_5 + 0]			# LN: 70 | 
	xmem[_processingState + 0] = a0h			# LN: 70 | 
cline_70_0:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_3_5 + 0]			# LN: 71 | 
	xmem[_processingState + 1] = a0h			# LN: 71 | 
cline_71_0:			/* LN: 72 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 72 | 
	xmem[_processingState + 2] = a0h			# LN: 72 | 
	jmp (endif_4)			# LN: 72 | 
cline_72_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
else_4:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 76 | 
	a0 = xmem[i0]			# LN: 76 | 
	uhalfword(a1) = (0x4)			# LN: 76 | 
	a0 = a0 - a1			# LN: 76 | 
	if (a != 0) jmp (else_5)			# LN: 76 | 
cline_76_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 84 | 
	i0 = xmem[i0]			# LN: 84 | 
	uhalfword(a0) = (0x30)			# LN: 84 | 
	a1 = xmem[i0]			# LN: 84 | 
	a0 = a1 - a0			# LN: 84 | 
	xmem[_processingState + 3] = a0h			# LN: 84 | 
cline_84_0:			/* LN: 85 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_2_5 + 0]			# LN: 85 | 
	xmem[_processingState + 0] = a0h			# LN: 85 | 
cline_85_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_3_5 + 0]			# LN: 86 | 
	xmem[_processingState + 1] = a0h			# LN: 86 | 
cline_86_0:			/* LN: 87 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 87 | 
	xmem[_processingState + 2] = a0h			# LN: 87 | 
	jmp (endif_5)			# LN: 87 | 
cline_87_0:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
else_5:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 96 | 
	i0 = xmem[i0]			# LN: 96 | 
	uhalfword(a0) = (0x30)			# LN: 96 | 
	a1 = xmem[i0]			# LN: 96 | 
	a0 = a1 - a0			# LN: 96 | 
	xmem[_processingState + 3] = a0h			# LN: 96 | 
cline_96_0:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_2_5 + 0]			# LN: 97 | 
	xmem[_processingState + 0] = a0h			# LN: 97 | 
cline_97_0:			/* LN: 98 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_3_5 + 0]			# LN: 98 | 
	xmem[_processingState + 1] = a0h			# LN: 98 | 
cline_98_0:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 99 | 
	xmem[_processingState + 2] = a0h			# LN: 99 | 
cline_99_0:			/* LN: 105 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
endif_4:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
endif_5:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
	call (_gainConverter)			# LN: 105 | 
cline_105_0:			/* LN: 107 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 107 | 
	jmp (__epilogue_114)			# LN: 107 | 
cline_107_0:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
__epilogue_114:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 108 | 
	i7 -= 1			# LN: 108 | 
	i2 = xmem[i7]; i7 -= 1			# LN: 108, 108 | 
	ret			# LN: 108 | 



_processing_input_gain:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 111 | 
	i7 += 1			# LN: 111 | 
	i7 = i7 + (0x5)			# LN: 111 | 
	i4 = i7 - (0x1)			# LN: 111 | 
	xmem[i4] = i0			# LN: 111 | 
	i0 = i7 - (0x2)			# LN: 111 | 
	xmem[i0] = i1			# LN: 111 | 
cline_111_0:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 113 | 
	a0 = xmem[i0]			# LN: 113 | 
	i0 = i7 - (0x3)			# LN: 113 | 
	xmem[i0] = a0			# LN: 113 | 
cline_113_0:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 114 | 
	a0 = xmem[i0]			# LN: 114 | 
	i0 = i7 - (0x4)			# LN: 114 | 
	xmem[i0] = a0			# LN: 114 | 
cline_114_0:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 117 | 
	a0 = 0			# LN: 117 | 
	xmem[i0] = a0h			# LN: 117 | 
	do (0x10), label_end_98			# LN: 117 | 
cline_117_0:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
label_begin_98:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 120 | 
	i0 = xmem[i0]			# LN: 120 | 
	x0 = xmem[_processingState + 0]			# LN: 120 | 
	x1 = xmem[i0]			# LN: 120 | 
	i0 = i7 - (0x4)			# LN: 120 | 
	i0 = xmem[i0]			# LN: 120 | 
	a0 = x1 * x0			# LN: 120 | 
	xmem[i0] = a0			# LN: 120 | 
cline_120_0:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 121 | 
	i0 = xmem[i0]			# LN: 121 | 
	i1 = i7 - (0x3)			# LN: 121 | 
	i0 += 1			# LN: 121 | 
	xmem[i1] = i0			# LN: 121 | 
cline_121_0:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 122 | 
	i0 = xmem[i0]			# LN: 122 | 
	i1 = i7 - (0x4)			# LN: 122 | 
	i0 += 1			# LN: 122 | 
	xmem[i1] = i0			# LN: 122 | 
cline_122_0:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 123 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 117 | 
	a0 = xmem[i0]			# LN: 117 | 
	uhalfword(a1) = (0x1)			# LN: 117 | 
	a0 = a0 + a1			# LN: 117 | 
	i0 = i7 - (0x5)			# LN: 117 | 
label_end_98:			# LN: 117 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 117 | 
cline_117_1:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 117 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_116)			# LN: 124 | 
__epilogue_116:			/* LN: 124 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 124 | 
	i7 -= 1			# LN: 124 | 
	ret			# LN: 124 | 



_processing_sum:			/* LN: 172 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 172 | 
	i7 += 1			# LN: 172 | 
	i7 = i7 + (0x7)			# LN: 172 | 
	i5 = i7 - (0x1)			# LN: 172 | 
	xmem[i5] = i0			# LN: 172 | 
	i0 = i7 - (0x2)			# LN: 172 | 
	xmem[i0] = i1			# LN: 172 | 
	i0 = i7 - (0x3)			# LN: 172 | 
	xmem[i0] = i4			# LN: 172 | 
cline_172_0:			/* LN: 174 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 174 | 
	a0 = xmem[i0]			# LN: 174 | 
	i0 = i7 - (0x4)			# LN: 174 | 
	xmem[i0] = a0			# LN: 174 | 
cline_174_0:			/* LN: 175 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 175 | 
	a0 = xmem[i0]			# LN: 175 | 
	i0 = i7 - (0x5)			# LN: 175 | 
	xmem[i0] = a0			# LN: 175 | 
cline_175_0:			/* LN: 176 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 176 | 
	a0 = xmem[i0]			# LN: 176 | 
	i0 = i7 - (0x6)			# LN: 176 | 
	xmem[i0] = a0			# LN: 176 | 
cline_176_0:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 179 | 
	a0 = 0			# LN: 179 | 
	xmem[i0] = a0h			# LN: 179 | 
	do (0x10), label_end_94			# LN: 179 | 
cline_179_0:			/* LN: 182 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 182 | 
	i0 = xmem[i0]			# LN: 182 | 
	i1 = i7 - (0x5)			# LN: 182 | 
	i1 = xmem[i1]			# LN: 182 | 
	a0 = xmem[i0]			# LN: 182 | 
	a1 = xmem[i1]			# LN: 182 | 
	i0 = i7 - (0x6)			# LN: 182 | 
	i0 = xmem[i0]			# LN: 182 | 
	a0 = a0 + a1			# LN: 182 | 
	xmem[i0] = a0h			# LN: 182 | 
cline_182_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 183 | 
	i0 = xmem[i0]			# LN: 183 | 
	i1 = i7 - (0x4)			# LN: 183 | 
	i0 += 1			# LN: 183 | 
	xmem[i1] = i0			# LN: 183 | 
cline_183_0:			/* LN: 184 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 184 | 
	i0 = xmem[i0]			# LN: 184 | 
	i1 = i7 - (0x5)			# LN: 184 | 
	i0 += 1			# LN: 184 | 
	xmem[i1] = i0			# LN: 184 | 
cline_184_0:			/* LN: 185 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x6)			# LN: 185 | 
	i0 = xmem[i0]			# LN: 185 | 
	i1 = i7 - (0x6)			# LN: 185 | 
	i0 += 1			# LN: 185 | 
	xmem[i1] = i0			# LN: 185 | 
cline_185_0:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 186 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x7)			# LN: 179 | 
	a0 = xmem[i0]			# LN: 179 | 
	uhalfword(a1) = (0x1)			# LN: 179 | 
	a0 = a0 + a1			# LN: 179 | 
	i0 = i7 - (0x7)			# LN: 179 | 
label_end_94:			# LN: 179 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 179 | 
cline_179_1:			/* LN: 187 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 179 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_124)			# LN: 187 | 
__epilogue_124:			/* LN: 187 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x7)			# LN: 187 | 
	i7 -= 1			# LN: 187 | 
	ret			# LN: 187 | 

	.public _compressor
	.public _audio_compressor_init
	.public _gst_audio_dynamic_transform_compressor
	.xdata_ovly
__extractedConst_0_2
	.dw  (0x7fffffff)
	.xdata_ovly
_compressor
	.bss (0x2)
	.code_ovly



_audio_compressor_init:			/* LN: 15 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 15 | 
	i7 += 1			# LN: 15 | 
cline_15_0:			/* LN: 16 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_2 + 0]			# LN: 16 | 
	xmem[_compressor + 1] = a0h			# LN: 16 | 
cline_16_0:			/* LN: 17 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 17 | 
	xmem[_compressor + 0] = a0h			# LN: 17 | 
cline_17_0:			/* LN: 18 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_104)			# LN: 18 | 
__epilogue_104:			/* LN: 18 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 18 | 
	ret			# LN: 18 | 



_gst_audio_dynamic_transform_compressor:			/* LN: 20 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 20 | 
	i7 += 1			# LN: 20 | 
	i7 = i7 + (0x4)			# LN: 20 | 
	i1 = i7 - (0x1)			# LN: 20 | 
	xmem[i1] = i0			# LN: 20 | 
cline_20_0:			/* LN: 21 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_compressor + 0]			# LN: 21 | 
	i0 = i7 - (0x2)			# LN: 21 | 
	xmem[i0] = a0h			# LN: 21 | 
cline_21_0:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_compressor + 1]			# LN: 25 | 
	a1 = xmem[__extractedConst_0_2 + 0]			# LN: 25 | 
	a0 - a1			# LN: 25 | 
	if (a != 0) jmp (else_0)			# LN: 25 | 
cline_25_0:			/* LN: 26 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 26 | 
cline_26_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 28 | 
	a0 = 0			# LN: 28 | 
	xmem[i0] = a0h			# LN: 28 | 
	do (0x10), label_end_92			# LN: 28 | 
cline_28_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 29 | 
	a0 = xmem[i0]			# LN: 29 | 
	i0 = i7 - (0x1)			# LN: 29 | 
	a1 = xmem[i0]			# LN: 29 | 
	a0 = a1 + a0			# LN: 29 | 
	AnyReg(i0, a0h)			# LN: 29 | 
	i1 = i7 - (0x4)			# LN: 29 | 
	a0 = xmem[i0]			# LN: 29 | 
	xmem[i1] = a0h			# LN: 29 | 
cline_29_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 31 | 
	a0 = xmem[i0]			# LN: 31 | 
	i0 = i7 - (0x2)			# LN: 31 | 
	a1 = xmem[i0]			# LN: 31 | 
	a0 - a1			# LN: 31 | 
	if (a <= 0) jmp (else_1)			# LN: 31 | 
cline_31_0:			/* LN: 32 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 32 | 
	a0 = xmem[i0]			# LN: 32 | 
	i0 = i7 - (0x2)			# LN: 32 | 
	a1 = xmem[i0]			# LN: 32 | 
	x0 = xmem[_compressor + 1]			# LN: 32 | 
	i0 = i7 - (0x2)			# LN: 32 | 
	a1 = xmem[i0]; a0 = a0 - a1			# LN: 32, 32 | 
	x1 = a0h; a0 =+ a1			# LN: 32, 32 | 
	a0 += x1 * x0			# LN: 32 | 
	i0 = i7 - (0x4)			# LN: 32 | 
	xmem[i0] = a0			# LN: 32 | 
	jmp (endif_1)			# LN: 32 | 
cline_32_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 34 | 
	a0 = xmem[i0]			# LN: 34 | 
	a0 =- a0			# LN: 34 | 
	i0 = i7 - (0x4)			# LN: 34 | 
	a1 = xmem[i0]			# LN: 34 | 
	a1 - a0			# LN: 34 | 
	if (a >= 0) jmp (else_2)			# LN: 34 | 
cline_34_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 35 | 
	a0 = xmem[i0]			# LN: 35 | 
	i0 = i7 - (0x4)			# LN: 35 | 
	a1 = xmem[i0]; a0 =- a0			# LN: 35, 35 | 
	i0 = i7 - (0x2)			# LN: 35 | 
	b0 = xmem[i0]			# LN: 35 | 
	a1 = a1 + b0			# LN: 35 | 
	x0 = xmem[_compressor + 1]			# LN: 35 | 
	x1 = a1h			# LN: 35 | 
	a0 += x1 * x0			# LN: 35 | 
	i0 = i7 - (0x4)			# LN: 35 | 
	xmem[i0] = a0			# LN: 35 | 
	jmp (endif_2)			# LN: 35 | 
cline_35_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 37 | 
	a0 = xmem[i0]			# LN: 37 | 
	i0 = i7 - (0x1)			# LN: 37 | 
	a1 = xmem[i0]			# LN: 37 | 
	a0 = a1 + a0			# LN: 37 | 
	AnyReg(i0, a0h)			# LN: 37 | 
	i1 = i7 - (0x4)			# LN: 37 | 
	a0 = xmem[i1]			# LN: 37 | 
	xmem[i0] = a0h			# LN: 37 | 
cline_37_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 38 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 28 | 
	a0 = xmem[i0]			# LN: 28 | 
	uhalfword(a1) = (0x1)			# LN: 28 | 
	a0 = a0 + a1			# LN: 28 | 
	i0 = i7 - (0x3)			# LN: 28 | 
label_end_92:			# LN: 28 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 28 | 
cline_28_1:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 40 | 
__epilogue_106:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x4)			# LN: 40 | 
	i7 -= 1			# LN: 40 | 
	ret			# LN: 40 | 

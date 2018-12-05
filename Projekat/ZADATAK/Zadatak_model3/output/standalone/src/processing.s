	.extern _input_gain
	.extern _processingState
	.extern _sampleBuffer
	.public _gainConverter
	.extern _init
	.extern _processBlock
	.public _processing
	.public _processing_C
	.public _processing_S
	.public _processing_init
	.xdata_ovly
__extractedConst_0_1
	.dw  (0x5a9df7ac)
	.code_ovly



_gainConverter:			/* LN: 9 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 9 | 
	i7 += 1			# LN: 9 | 
cline_9_0:			/* LN: 12 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_input_gain + 0]			# LN: 12 | 
	a0 & a0			# LN: 12 | 
	if (a <= 0) jmp (else_0)			# LN: 12 | 
cline_12_0:			/* LN: 14 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 14 | 
	xmem[_input_gain + 0] = a0h			# LN: 14 | 
	jmp (endif_0)			# LN: 14 | 
cline_14_0:			/* LN: 19 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 12 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 12 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_1 + 0]			# LN: 19 | 
	xmem[_processingState + 0] = a0h			# LN: 19 | 
cline_19_0:			/* LN: 21 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_226)			# LN: 21 | 
__epilogue_226:			/* LN: 21 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 21 | 
	ret			# LN: 21 | 



_processing:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 70 | 
	i7 += 1			# LN: 70 | 
	i7 = i7 + (0x2)			# LN: 70 | 
	i4 = i7 - (0x1)			# LN: 70 | 
	xmem[i4] = i0			# LN: 70 | 
	i0 = i7 - (0x2)			# LN: 70 | 
	xmem[i0] = i1			# LN: 70 | 
cline_70_0:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 73 | 
	i0 = xmem[i0]			# LN: 73 | 
	i1 = i7 - (0x2)			# LN: 73 | 
	i1 = xmem[i1]			# LN: 73 | 
	call (_processing_S)			# LN: 73 | 
cline_73_0:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 74 | 
	i0 = xmem[i0]			# LN: 74 | 
	i1 = i7 - (0x2)			# LN: 74 | 
	i1 = xmem[i1]			# LN: 74 | 
	i0 = i0 + (0x10)			# LN: 74 | 
	i1 = i1 + (0x10)			# LN: 74 | 
	call (_processing_S)			# LN: 74 | 
cline_74_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 75 | 
	i1 = i7 - (0x2)			# LN: 75 | 
	i1 = xmem[i1]			# LN: 75 | 
	i0 = xmem[i0]			# LN: 75 | 
	i1 = i1 + (0x20)			# LN: 75 | 
	call (_processing_C)			# LN: 75 | 
cline_75_0:			/* LN: 76 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 76 | 
	i0 = xmem[i0]			# LN: 76 | 
	i1 = i7 - (0x2)			# LN: 76 | 
	i1 = xmem[i1]			# LN: 76 | 
	i0 = i0 + (0x10)			# LN: 76 | 
	i1 = i1 + (0x30)			# LN: 76 | 
	call (_processing_C)			# LN: 76 | 
cline_76_0:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processingState + 1]			# LN: 78 | 
	uhalfword(a1) = (0x1)			# LN: 78 | 
	a0 = a0 - a1			# LN: 78 | 
	a0g = (0x0)			# LN: 78 | 
	a0 & a0			# LN: 78 | 
	if (a != 0) jmp (else_1)			# LN: 78 | 
cline_78_0:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 80 | 
	i0 = xmem[i0]			# LN: 80 | 
	i1 = i7 - (0x2)			# LN: 80 | 
	i1 = xmem[i1]			# LN: 80 | 
	call (_processBlock)			# LN: 80 | 
cline_80_0:			/* LN: 81 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 81 | 
	i0 = xmem[i0]			# LN: 81 | 
	i1 = i7 - (0x2)			# LN: 81 | 
	i1 = xmem[i1]			# LN: 81 | 
	i0 = i0 + (0x10)			# LN: 81 | 
	i1 = i1 + (0x10)			# LN: 81 | 
	call (_processBlock)			# LN: 81 | 
	jmp (endif_1)			# LN: 81 | 
cline_81_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_234)			# LN: 84 | 
__epilogue_234:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x2)			# LN: 84 | 
	i7 -= 1			# LN: 84 | 
	ret			# LN: 84 | 



_processing_C:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 54 | 
	i7 += 1			# LN: 54 | 
	i7 = i7 + (0x5)			# LN: 54 | 
	i4 = i7 - (0x1)			# LN: 54 | 
	xmem[i4] = i0			# LN: 54 | 
	i0 = i7 - (0x2)			# LN: 54 | 
	xmem[i0] = i1			# LN: 54 | 
cline_54_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 56 | 
	a0 = xmem[i0]			# LN: 56 | 
	i0 = i7 - (0x3)			# LN: 56 | 
	xmem[i0] = a0			# LN: 56 | 
cline_56_0:			/* LN: 57 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 57 | 
	a0 = xmem[i0]			# LN: 57 | 
	i0 = i7 - (0x4)			# LN: 57 | 
	xmem[i0] = a0			# LN: 57 | 
cline_57_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 60 | 
	a0 = 0			# LN: 60 | 
	xmem[i0] = a0h			# LN: 60 | 
	do (0x10), label_end_92			# LN: 60 | 
cline_60_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 63 | 
	i0 = xmem[i0]			# LN: 63 | 
	i1 = i7 - (0x4)			# LN: 63 | 
	i1 = xmem[i1]			# LN: 63 | 
	a0 = xmem[i0]			# LN: 63 | 
	xmem[i1] = a0h			# LN: 63 | 
cline_63_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 64 | 
	i0 = xmem[i0]			# LN: 64 | 
	i1 = i7 - (0x3)			# LN: 64 | 
	i0 += 1			# LN: 64 | 
	xmem[i1] = i0			# LN: 64 | 
cline_64_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 65 | 
	i0 = xmem[i0]			# LN: 65 | 
	i1 = i7 - (0x4)			# LN: 65 | 
	i0 += 1			# LN: 65 | 
	xmem[i1] = i0			# LN: 65 | 
cline_65_0:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 66 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 60 | 
	a0 = xmem[i0]			# LN: 60 | 
	uhalfword(a1) = (0x1)			# LN: 60 | 
	a0 = a0 + a1			# LN: 60 | 
	i0 = i7 - (0x5)			# LN: 60 | 
label_end_92:			# LN: 60 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 60 | 
cline_60_1:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 60 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_232)			# LN: 67 | 
__epilogue_232:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 67 | 
	i7 -= 1			# LN: 67 | 
	ret			# LN: 67 | 



_processing_S:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 39 | 
	i7 += 1			# LN: 39 | 
	i7 = i7 + (0x5)			# LN: 39 | 
	i4 = i7 - (0x1)			# LN: 39 | 
	xmem[i4] = i0			# LN: 39 | 
	i0 = i7 - (0x2)			# LN: 39 | 
	xmem[i0] = i1			# LN: 39 | 
cline_39_0:			/* LN: 41 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 41 | 
	a0 = xmem[i0]			# LN: 41 | 
	i0 = i7 - (0x3)			# LN: 41 | 
	xmem[i0] = a0			# LN: 41 | 
cline_41_0:			/* LN: 42 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 42 | 
	a0 = xmem[i0]			# LN: 42 | 
	i0 = i7 - (0x4)			# LN: 42 | 
	xmem[i0] = a0			# LN: 42 | 
cline_42_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 45 | 
	a0 = 0			# LN: 45 | 
	xmem[i0] = a0h			# LN: 45 | 
	do (0x10), label_end_93			# LN: 45 | 
cline_45_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 48 | 
	i0 = xmem[i0]			# LN: 48 | 
	x0 = xmem[_processingState + 0]			# LN: 48 | 
	x1 = xmem[i0]			# LN: 48 | 
	i0 = i7 - (0x4)			# LN: 48 | 
	i0 = xmem[i0]			# LN: 48 | 
	a0 = x1 * x0			# LN: 48 | 
	xmem[i0] = a0			# LN: 48 | 
cline_48_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 49 | 
	i0 = xmem[i0]			# LN: 49 | 
	i1 = i7 - (0x3)			# LN: 49 | 
	i0 += 1			# LN: 49 | 
	xmem[i1] = i0			# LN: 49 | 
cline_49_0:			/* LN: 50 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 50 | 
	i0 = xmem[i0]			# LN: 50 | 
	i1 = i7 - (0x4)			# LN: 50 | 
	i0 += 1			# LN: 50 | 
	xmem[i1] = i0			# LN: 50 | 
cline_50_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 51 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 45 | 
	a0 = xmem[i0]			# LN: 45 | 
	uhalfword(a1) = (0x1)			# LN: 45 | 
	a0 = a0 + a1			# LN: 45 | 
	i0 = i7 - (0x5)			# LN: 45 | 
label_end_93:			# LN: 45 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 45 | 
cline_45_1:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 45 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_230)			# LN: 52 | 
__epilogue_230:			/* LN: 52 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x5)			# LN: 52 | 
	i7 -= 1			# LN: 52 | 
	ret			# LN: 52 | 



_processing_init:			/* LN: 25 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 25 | 
	i7 += 1			# LN: 25 | 
	i7 = i7 + (0x4)			# LN: 25 | 
	i0 = i7 - (0x1)			# LN: 25 | 
	xmem[i0] = a0h			# LN: 25 | 
	i0 = i7 - (0x2)			# LN: 25 | 
	xmem[i0] = a1h			# LN: 25 | 
	i0 = i7 - (0x3)			# LN: 25 | 
	xmem[i0] = b0h			# LN: 25 | 
	i0 = i7 - (0x4)			# LN: 25 | 
	xmem[i0] = b1h			# LN: 25 | 
cline_25_0:			/* LN: 27 | CYCLE: 0 | RULES: () */ 
	call (_init)			# LN: 27 | 
cline_27_0:			/* LN: 30 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 30 | 
	a0 = xmem[i0]			# LN: 30 | 
	xmem[_processingState + 1] = a0h			# LN: 30 | 
cline_30_0:			/* LN: 31 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 31 | 
	a0 = xmem[i0]			# LN: 31 | 
	xmem[_processingState + 2] = a0h			# LN: 31 | 
cline_31_0:			/* LN: 33 | CYCLE: 0 | RULES: () */ 
	call (_gainConverter)			# LN: 33 | 
cline_33_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 35 | 
	jmp (__epilogue_228)			# LN: 35 | 
cline_35_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
__epilogue_228:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x4)			# LN: 36 | 
	i7 -= 1			# LN: 36 | 
	ret			# LN: 36 | 

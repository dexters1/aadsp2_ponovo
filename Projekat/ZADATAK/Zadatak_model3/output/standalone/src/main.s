	.public _input_gain
	.public _processingState
	.public _sampleBuffer
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_number_of_frames
	.extern _cl_wavread_open
	.extern _cl_wavread_recvsample
	.extern _cl_wavwrite_close
	.extern _cl_wavwrite_open
	.extern _cl_wavwrite_sendsample
	.public _main
	.extern _printf
	.extern _processing
	.extern _processing_init
	.extern _strcpy
	.extern __div
	.xdata_ovly
_input_gain
	.bss (0x1)
	.xdata_ovly
_processingState
	.bss (0x3)
	.xdata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
	.dw  (0x54)
	.dw  (0x65)
	.dw  (0x73)
	.dw  (0x74)
	.dw  (0x53)
	.dw  (0x74)
	.dw  (0x72)
	.dw  (0x65)
	.dw  (0x61)
	.dw  (0x6d)
	.dw  (0x73)
	.dw  (0x2f)
	.dw  (0x74)
	.dw  (0x69)
	.dw  (0x74)
	.dw  (0x61)
	.dw  (0x6e)
	.dw  (0x69)
	.dw  (0x63)
	.dw  (0x5f)
	.dw  (0x68)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x6e)
	.dw  (0x2e)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x0)
	.xdata_ovly
_string_const_1
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x69)
	.dw  (0x6e)
	.dw  (0x70)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.xdata_ovly
_string_const_2
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
	.dw  (0x54)
	.dw  (0x65)
	.dw  (0x73)
	.dw  (0x74)
	.dw  (0x53)
	.dw  (0x74)
	.dw  (0x72)
	.dw  (0x65)
	.dw  (0x61)
	.dw  (0x6d)
	.dw  (0x73)
	.dw  (0x2f)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x70)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x5f)
	.dw  (0x6d)
	.dw  (0x6f)
	.dw  (0x64)
	.dw  (0x65)
	.dw  (0x6c)
	.dw  (0x33)
	.dw  (0x2e)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x0)
	.xdata_ovly
_string_const_3
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x3a)
	.dw  (0x20)
	.dw  (0x43)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x6c)
	.dw  (0x64)
	.dw  (0x20)
	.dw  (0x6e)
	.dw  (0x6f)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x6e)
	.dw  (0x20)
	.dw  (0x6f)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x70)
	.dw  (0x75)
	.dw  (0x74)
	.dw  (0x20)
	.dw  (0x77)
	.dw  (0x61)
	.dw  (0x76)
	.dw  (0x65)
	.dw  (0x66)
	.dw  (0x69)
	.dw  (0x6c)
	.dw  (0x65)
	.dw  (0x2e)
	.dw  (0xa)
	.dw  (0x0)
	.code_ovly



	# This construction should ensure linking of crt0 in case when target is a standalone program without the OS
	.if defined(_OVLY_)
		.if .strcmp('standalone',_OVLY_)=0
		.if .strcmp('crystal32',_TARGET_FAMILY_)=0
			.extern __start         # dummy use of __start to force linkage of crt0
dummy		.equ(__start)
		.else
			.extern __intvec         # dummy use of __intvec to force linkage of intvec
dummy		.equ(__intvec)
		.endif
		.endif
	.endif

_main:			/* LN: 13 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 13 | 
	i7 += 1			# LN: 13 | 
	i7 = i7 + (0x211)			# LN: 13 | 
	i1 = i7 - (0x1)			# LN: 13 | 
	xmem[i1] = a0h			# LN: 13 | 
	i1 = i7 - (0x2)			# LN: 13 | 
	xmem[i1] = i0			# LN: 13 | 
cline_13_0:			/* LN: 28 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 28 | 
	uhalfword(a0) = (0x1)			# LN: 28 | 
	xmem[i0] = a0h			# LN: 28 | 
cline_28_0:			/* LN: 29 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 29 | 
	ufixed16(a0) = (0xffff)			# LN: 29 | 
	lo16(a0) = (0xfffd)			# LN: 29 | 
	xmem[i0] = a0h			# LN: 29 | 
cline_29_0:			/* LN: 30 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 30 | 
	uhalfword(a0) = (0x1)			# LN: 30 | 
	xmem[i0] = a0h			# LN: 30 | 
cline_30_0:			/* LN: 34 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (261 - 0)			# LN: 34 | 
	i1 = (0) + (_string_const_0)			# LN: 34 | 
	call (_strcpy)			# LN: 34 | 
cline_34_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (261 - 0)			# LN: 35 | 
	call (_cl_wavread_open)			# LN: 35 | 
	AnyReg(i0, a0h)			# LN: 35 | 
	i1 = i7 - (0x106)			# LN: 35 | 
	xmem[i1] = i0			# LN: 35 | 
cline_35_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 36 | 
	a0 = xmem[i0]			# LN: 36 | 
	a0 & a0			# LN: 36 | 
	if (a != 0) jmp (else_0)			# LN: 36 | 
cline_36_0:			/* LN: 38 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 38 | 
	call (_printf)			# LN: 38 | 
cline_38_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 39 | 
	jmp (__epilogue_236)			# LN: 39 | 
cline_39_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 46 | 
	uhalfword(a0) = (0x4)			# LN: 46 | 
	xmem[i0] = a0h			# LN: 46 | 
cline_46_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 47 | 
	i0 = xmem[i0]			# LN: 47 | 
	call (_cl_wavread_bits_per_sample)			# LN: 47 | 
	i0 = i7 - (0x108)			# LN: 47 | 
	xmem[i0] = a0h			# LN: 47 | 
cline_47_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 48 | 
	i0 = xmem[i0]			# LN: 48 | 
	call (_cl_wavread_frame_rate)			# LN: 48 | 
	i0 = i7 - (0x109)			# LN: 48 | 
	xmem[i0] = a0h			# LN: 48 | 
cline_48_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 49 | 
	i0 = xmem[i0]			# LN: 49 | 
	call (_cl_wavread_number_of_frames)			# LN: 49 | 
	i0 = i7 - (0x10a)			# LN: 49 | 
	xmem[i0] = a0h			# LN: 49 | 
cline_49_0:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (522 - 0)			# LN: 54 | 
	i1 = (0) + (_string_const_2)			# LN: 54 | 
	call (_strcpy)			# LN: 54 | 
cline_54_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (522 - 0)			# LN: 55 | 
	i1 = i7 - (0x108)			# LN: 55 | 
	a0 = xmem[i1]			# LN: 55 | 
	i1 = i7 - (0x107)			# LN: 55 | 
	a1 = xmem[i1]			# LN: 55 | 
	i1 = i7 - (0x109)			# LN: 55 | 
	b0 = xmem[i1]			# LN: 55 | 
	call (_cl_wavwrite_open)			# LN: 55 | 
	AnyReg(i0, a0h)			# LN: 55 | 
	i1 = i7 - (0x20b)			# LN: 55 | 
	xmem[i1] = i0			# LN: 55 | 
cline_55_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 56 | 
	a0 = xmem[i0]			# LN: 56 | 
	a0 & a0			# LN: 56 | 
	if (a != 0) jmp (else_1)			# LN: 56 | 
cline_56_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_3)			# LN: 58 | 
	call (_printf)			# LN: 58 | 
cline_58_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 59 | 
	jmp (__epilogue_236)			# LN: 59 | 
cline_59_0:			/* LN: 67 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 67 | 
	a0 = xmem[i0]			# LN: 67 | 
	i0 = i7 - (0x4)			# LN: 67 | 
	a1 = xmem[i0]			# LN: 67 | 
	i0 = i7 - (0x5)			# LN: 67 | 
	b0 = xmem[i0]			# LN: 67 | 
	uhalfword(b1) = (0x6)			# LN: 67 | 
	call (_processing_init)			# LN: 67 | 
	i0 = i7 - (0x20c)			# LN: 67 | 
	xmem[i0] = a0h			# LN: 67 | 
cline_67_0:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 68 | 
	a0 = xmem[i0]			# LN: 68 | 
	a0 & a0			# LN: 68 | 
	if (a == 0) jmp (else_2)			# LN: 68 | 
cline_68_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 69 | 
	jmp (__epilogue_236)			# LN: 69 | 
cline_69_0:			/* LN: 80 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x10a)			# LN: 80 | 
	a0 = xmem[i0]			# LN: 80 | 
	uhalfword(a1) = (0x10)			# LN: 80 | 
	call (__div)			# LN: 80 | 
	i0 = i7 - (0x20d)			# LN: 80 | 
	xmem[i0] = a0h			# LN: 80 | 
cline_80_0:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 82 | 
	a0 = 0			# LN: 82 | 
	xmem[i0] = a0h			# LN: 82 | 
for_0:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 82 | 
	a0 = xmem[i0]			# LN: 82 | 
	i0 = i7 - (0x20d)			# LN: 82 | 
	a1 = xmem[i0]			# LN: 82 | 
	a0 - a1			# LN: 82 | 
	if (a >= 0) jmp (for_end_0)			# LN: 82 | 
cline_82_0:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 84 | 
	a0 = 0			# LN: 84 | 
	xmem[i0] = a0h			# LN: 84 | 
	do (0x10), label_end_92			# LN: 84 | 
cline_84_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 86 | 
	a0 = 0			# LN: 86 | 
	xmem[i0] = a0h			# LN: 86 | 
for_2:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 86 | 
	a0 = xmem[i0]			# LN: 86 | 
	i0 = i7 - (0x107)			# LN: 86 | 
	a1 = xmem[i0]			# LN: 86 | 
	a0 - a1			# LN: 86 | 
	if (a >= 0) jmp (for_end_2)			# LN: 86 | 
cline_86_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 88 | 
	i0 = xmem[i0]			# LN: 88 | 
	call (_cl_wavread_recvsample)			# LN: 88 | 
	i0 = i7 - (0x211)			# LN: 88 | 
	xmem[i0] = a0h			# LN: 88 | 
cline_88_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 89 | 
	a0 = xmem[i0]			# LN: 89 | 
	a0 = a0 << 4			# LN: 89 | 
	i0 = a0			# LN: 89 | 
	i1 = i7 - (0x20f)			# LN: 89 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 89 | 
	a0 = xmem[i1]			# LN: 89 | 
	a1 = i0			# LN: 89 | 
	a0 = a1 + a0			# LN: 89 | 
	AnyReg(i0, a0h)			# LN: 89 | 
	i1 = i7 - (0x211)			# LN: 89 | 
	a0 = xmem[i1]			# LN: 89 | 
	xmem[i0] = a0h			# LN: 89 | 
cline_89_0:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 90 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 86 | 
	a0 = xmem[i0]			# LN: 86 | 
	uhalfword(a1) = (0x1)			# LN: 86 | 
	a0 = a0 + a1			# LN: 86 | 
	i0 = i7 - (0x210)			# LN: 86 | 
	xmem[i0] = a0h			# LN: 86 | 
	jmp (for_2)			# LN: 86 | 
cline_86_1:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 91 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 86 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 84 | 
	a0 = xmem[i0]			# LN: 84 | 
	uhalfword(a1) = (0x1)			# LN: 84 | 
	a0 = a0 + a1			# LN: 84 | 
	i0 = i7 - (0x20f)			# LN: 84 | 
label_end_92:			# LN: 84 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 84 | 
cline_84_1:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processingState + 2]			# LN: 97 | 
	a0g = (0x0)			# LN: 97 | 
	a0 & a0			# LN: 97 | 
	if (a == 0) jmp (else_3)			# LN: 97 | 
cline_97_0:			/* LN: 98 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer)			# LN: 98 | 
	i1 = (0) + (_sampleBuffer)			# LN: 98 | 
	call (_processing)			# LN: 98 | 
	jmp (endif_3)			# LN: 98 | 
cline_98_0:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 101 | 
	a0 = 0			# LN: 101 | 
	xmem[i0] = a0h			# LN: 101 | 
	do (0x10), label_end_93			# LN: 101 | 
cline_101_0:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 103 | 
	a0 = 0			# LN: 103 | 
	xmem[i0] = a0h			# LN: 103 | 
for_4:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 103 | 
	a0 = xmem[i0]			# LN: 103 | 
	i0 = i7 - (0x107)			# LN: 103 | 
	a1 = xmem[i0]			# LN: 103 | 
	a0 - a1			# LN: 103 | 
	if (a >= 0) jmp (for_end_4)			# LN: 103 | 
cline_103_0:			/* LN: 105 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 105 | 
	a0 = xmem[i0]			# LN: 105 | 
	a0 = a0 << 4			# LN: 105 | 
	i0 = a0			# LN: 105 | 
	i1 = i7 - (0x20f)			# LN: 105 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 105 | 
	a0 = xmem[i1]			# LN: 105 | 
	a1 = i0			# LN: 105 | 
	a0 = a1 + a0			# LN: 105 | 
	AnyReg(i0, a0h)			# LN: 105 | 
	i1 = i7 - (0x211)			# LN: 105 | 
	a0 = xmem[i0]			# LN: 105 | 
	xmem[i1] = a0h			# LN: 105 | 
cline_105_0:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 106 | 
	i1 = i7 - (0x211)			# LN: 106 | 
	a0 = xmem[i1]			# LN: 106 | 
	i0 = xmem[i0]			# LN: 106 | 
	call (_cl_wavwrite_sendsample)			# LN: 106 | 
cline_106_0:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 107 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x210)			# LN: 103 | 
	a0 = xmem[i0]			# LN: 103 | 
	uhalfword(a1) = (0x1)			# LN: 103 | 
	a0 = a0 + a1			# LN: 103 | 
	i0 = i7 - (0x210)			# LN: 103 | 
	xmem[i0] = a0h			# LN: 103 | 
	jmp (for_4)			# LN: 103 | 
cline_103_1:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 103 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20f)			# LN: 101 | 
	a0 = xmem[i0]			# LN: 101 | 
	uhalfword(a1) = (0x1)			# LN: 101 | 
	a0 = a0 + a1			# LN: 101 | 
	i0 = i7 - (0x20f)			# LN: 101 | 
label_end_93:			# LN: 101 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 101 | 
cline_101_1:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 109 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 101 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20e)			# LN: 82 | 
	a0 = xmem[i0]			# LN: 82 | 
	uhalfword(a1) = (0x1)			# LN: 82 | 
	a0 = a0 + a1			# LN: 82 | 
	i0 = i7 - (0x20e)			# LN: 82 | 
	xmem[i0] = a0h			# LN: 82 | 
	jmp (for_0)			# LN: 82 | 
cline_82_1:			/* LN: 114 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x106)			# LN: 114 | 
	i0 = xmem[i0]			# LN: 114 | 
	call (_cl_wavread_close)			# LN: 114 | 
cline_114_0:			/* LN: 115 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 115 | 
	i0 = xmem[i0]			# LN: 115 | 
	call (_cl_wavwrite_close)			# LN: 115 | 
cline_115_0:			/* LN: 118 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 118 | 
	jmp (__epilogue_236)			# LN: 118 | 
cline_118_0:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
__epilogue_236:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x211)			# LN: 119 | 
	i7 -= 1			# LN: 119 | 
	ret			# LN: 119 | 

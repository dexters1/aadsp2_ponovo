	.public _headroom_gain
	.public _input_gain
	.public _processingState
	.public _sampleBuffer
	.extern _cl_wavread_bits_per_sample
	.extern _cl_wavread_close
	.extern _cl_wavread_frame_rate
	.extern _cl_wavread_getnchannels
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
_headroom_gain
	.bss (0x1)
	.xdata_ovly
_input_gain
	.bss (0x1)
	.xdata_ovly
_processingState
	.bss (0x4)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x45)
	.dw  (0x72)
	.dw  (0x72)
	.dw  (0x6f)
	.dw  (0x72)
	.dw  (0x32)
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
	.dw  (0x20)
	.dw  (0x25)
	.dw  (0x73)
	.dw  (0x2e)
	.dw  (0xa)
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
	.xdata_ovly
_string_const_2
	.dw  (0x31)
	.dw  (0x0)
	.xdata_ovly
_string_const_3
	.dw  (0x61)
	.dw  (0x0)
	.xdata_ovly
_string_const_4
	.dw  (0x61)
	.dw  (0x0)
	.xdata_ovly
_string_const_5
	.dw  (0x61)
	.dw  (0x73)
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

_main:			/* LN: 14 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 14 | 
	i7 += 1			# LN: 14 | 
	i7 = i7 + (0x20e)			# LN: 14 | 
	i1 = i7 - (0x1)			# LN: 14 | 
	xmem[i1] = a0h			# LN: 14 | 
	i1 = i7 - (0x2)			# LN: 14 | 
	xmem[i1] = i0			# LN: 14 | 
cline_14_0:			/* LN: 35 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 35 | 
	i0 = xmem[i0]			# LN: 35 | 
	i1 = i7 - (258 - 0)			# LN: 35 | 
	i4 = xmem[i0]			# LN: 35 | 
	i0 = i1			# LN: 35 | 
	i1 = i4			# LN: 35 | 
	call (_strcpy)			# LN: 35 | 
cline_35_0:			/* LN: 36 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (258 - 0)			# LN: 36 | 
	call (_cl_wavread_open)			# LN: 36 | 
	AnyReg(i0, a0h)			# LN: 36 | 
	i1 = i7 - (0x103)			# LN: 36 | 
	xmem[i1] = i0			# LN: 36 | 
cline_36_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 37 | 
	a0 = xmem[i0]			# LN: 37 | 
	a0 & a0			# LN: 37 | 
	if (a != 0) jmp (else_0)			# LN: 37 | 
cline_37_0:			/* LN: 39 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_0)			# LN: 39 | 
	i1 = i7 - (258 - 0)			# LN: 39 | 
	call (_printf)			# LN: 39 | 
cline_39_0:			/* LN: 40 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 40 | 
	jmp (__epilogue_234)			# LN: 40 | 
cline_40_0:			/* LN: 46 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 37 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 46 | 
	i0 = xmem[i0]			# LN: 46 | 
	call (_cl_wavread_getnchannels)			# LN: 46 | 
	i0 = i7 - (0x104)			# LN: 46 | 
	xmem[i0] = a0h			# LN: 46 | 
cline_46_0:			/* LN: 47 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 47 | 
	i0 = xmem[i0]			# LN: 47 | 
	call (_cl_wavread_bits_per_sample)			# LN: 47 | 
	i0 = i7 - (0x105)			# LN: 47 | 
	xmem[i0] = a0h			# LN: 47 | 
cline_47_0:			/* LN: 48 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 48 | 
	i0 = xmem[i0]			# LN: 48 | 
	call (_cl_wavread_frame_rate)			# LN: 48 | 
	i0 = i7 - (0x106)			# LN: 48 | 
	xmem[i0] = a0h			# LN: 48 | 
cline_48_0:			/* LN: 49 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 49 | 
	i0 = xmem[i0]			# LN: 49 | 
	call (_cl_wavread_number_of_frames)			# LN: 49 | 
	i0 = i7 - (0x107)			# LN: 49 | 
	xmem[i0] = a0h			# LN: 49 | 
cline_49_0:			/* LN: 54 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 54 | 
	i0 = xmem[i0]			# LN: 54 | 
	i1 = i7 - (519 - 0)			# LN: 54 | 
	i0 += 1			# LN: 54 | 
	i4 = xmem[i0]			# LN: 54 | 
	i0 = i1			# LN: 54 | 
	i1 = i4			# LN: 54 | 
	call (_strcpy)			# LN: 54 | 
cline_54_0:			/* LN: 55 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (519 - 0)			# LN: 55 | 
	i1 = i7 - (0x105)			# LN: 55 | 
	a0 = xmem[i1]			# LN: 55 | 
	uhalfword(a1) = (0x5)			# LN: 55 | 
	i1 = i7 - (0x106)			# LN: 55 | 
	b0 = xmem[i1]			# LN: 55 | 
	call (_cl_wavwrite_open)			# LN: 55 | 
	AnyReg(i0, a0h)			# LN: 55 | 
	i1 = i7 - (0x208)			# LN: 55 | 
	xmem[i1] = i0			# LN: 55 | 
cline_55_0:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x208)			# LN: 56 | 
	a0 = xmem[i0]			# LN: 56 | 
	a0 & a0			# LN: 56 | 
	if (a != 0) jmp (else_1)			# LN: 56 | 
cline_56_0:			/* LN: 58 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_1)			# LN: 58 | 
	call (_printf)			# LN: 58 | 
cline_58_0:			/* LN: 59 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 59 | 
	jmp (__epilogue_234)			# LN: 59 | 
cline_59_0:			/* LN: 63 | CYCLE: 0 | RULES: () */ 
endif_1:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 56 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_string_const_2)			# LN: 63 | 
	i1 = (0) + (_string_const_3)			# LN: 63 | 
	i4 = (0) + (_string_const_4)			# LN: 63 | 
	uhalfword(a0) = (0x6)			# LN: 63 | 
	i5 = (0) + (_string_const_5)			# LN: 63 | 
	call (_processing_init)			# LN: 63 | 
	i0 = i7 - (0x209)			# LN: 63 | 
	xmem[i0] = a0h			# LN: 63 | 
cline_63_0:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x209)			# LN: 64 | 
	a0 = xmem[i0]			# LN: 64 | 
	a0 & a0			# LN: 64 | 
	if (a == 0) jmp (else_2)			# LN: 64 | 
cline_64_0:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	halfword(a0) = (0xffff)			# LN: 65 | 
	jmp (__epilogue_234)			# LN: 65 | 
cline_65_0:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
endif_2:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 64 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x107)			# LN: 73 | 
	a0 = xmem[i0]			# LN: 73 | 
	uhalfword(a1) = (0x10)			# LN: 73 | 
	call (__div)			# LN: 73 | 
	i0 = i7 - (0x20a)			# LN: 73 | 
	xmem[i0] = a0h			# LN: 73 | 
cline_73_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 75 | 
	a0 = 0			# LN: 75 | 
	xmem[i0] = a0h			# LN: 75 | 
for_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 75 | 
	a0 = xmem[i0]			# LN: 75 | 
	i0 = i7 - (0x20a)			# LN: 75 | 
	a1 = xmem[i0]			# LN: 75 | 
	a0 - a1			# LN: 75 | 
	if (a >= 0) jmp (for_end_0)			# LN: 75 | 
cline_75_0:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 77 | 
	a0 = 0			# LN: 77 | 
	xmem[i0] = a0h			# LN: 77 | 
	do (0x10), label_end_92			# LN: 77 | 
cline_77_0:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 79 | 
	a0 = 0			# LN: 79 | 
	xmem[i0] = a0h			# LN: 79 | 
for_2:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 79 | 
	a0 = xmem[i0]			# LN: 79 | 
	i0 = i7 - (0x104)			# LN: 79 | 
	a1 = xmem[i0]			# LN: 79 | 
	a0 - a1			# LN: 79 | 
	if (a >= 0) jmp (for_end_2)			# LN: 79 | 
cline_79_0:			/* LN: 81 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 81 | 
	i0 = xmem[i0]			# LN: 81 | 
	call (_cl_wavread_recvsample)			# LN: 81 | 
	i0 = i7 - (0x20e)			# LN: 81 | 
	xmem[i0] = a0h			# LN: 81 | 
cline_81_0:			/* LN: 82 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 82 | 
	a0 = xmem[i0]			# LN: 82 | 
	a0 = a0 << 4			# LN: 82 | 
	i0 = a0			# LN: 82 | 
	i1 = i7 - (0x20c)			# LN: 82 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 82 | 
	a0 = xmem[i1]			# LN: 82 | 
	a1 = i0			# LN: 82 | 
	a0 = a1 + a0			# LN: 82 | 
	AnyReg(i0, a0h)			# LN: 82 | 
	i1 = i7 - (0x20e)			# LN: 82 | 
	a0 = xmem[i1]			# LN: 82 | 
	ymem[i0] = a0h			# LN: 82 | 
cline_82_0:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 79 | 
	a0 = xmem[i0]			# LN: 79 | 
	uhalfword(a1) = (0x1)			# LN: 79 | 
	a0 = a0 + a1			# LN: 79 | 
	i0 = i7 - (0x20d)			# LN: 79 | 
	xmem[i0] = a0h			# LN: 79 | 
	jmp (for_2)			# LN: 79 | 
cline_79_1:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
init_latch_label_1:			/* LN: 84 | CYCLE: 0 | RULES: () */ 
for_end_2:			/* LN: 79 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 77 | 
	a0 = xmem[i0]			# LN: 77 | 
	uhalfword(a1) = (0x1)			# LN: 77 | 
	a0 = a0 + a1			# LN: 77 | 
	i0 = i7 - (0x20c)			# LN: 77 | 
label_end_92:			# LN: 77 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 77 | 
cline_77_1:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
for_end_1:			/* LN: 77 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_processingState + 3]			# LN: 88 | 
	a0g = (0x0)			# LN: 88 | 
	a0 & a0			# LN: 88 | 
	if (a == 0) jmp (else_3)			# LN: 88 | 
cline_88_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer)			# LN: 89 | 
	i1 = (0) + (_sampleBuffer)			# LN: 89 | 
	call (_processing)			# LN: 89 | 
	jmp (endif_3)			# LN: 89 | 
cline_89_0:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
endif_3:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 92 | 
	a0 = 0			# LN: 92 | 
	xmem[i0] = a0h			# LN: 92 | 
	do (0x10), label_end_94			# LN: 92 | 
cline_92_0:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
label_begin_94:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 94 | 
	a0 = 0			# LN: 94 | 
	xmem[i0] = a0h			# LN: 94 | 
	do (0x5), label_end_93			# LN: 94 | 
cline_94_0:			/* LN: 96 | CYCLE: 0 | RULES: () */ 
label_begin_93:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 96 | 
	a0 = xmem[i0]			# LN: 96 | 
	a0 = a0 << 4			# LN: 96 | 
	i0 = a0			# LN: 96 | 
	i1 = i7 - (0x20c)			# LN: 96 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 96 | 
	a0 = xmem[i1]			# LN: 96 | 
	a1 = i0			# LN: 96 | 
	a0 = a1 + a0			# LN: 96 | 
	AnyReg(i0, a0h)			# LN: 96 | 
	i1 = i7 - (0x20e)			# LN: 96 | 
	a0 = ymem[i0]			# LN: 96 | 
	xmem[i1] = a0h			# LN: 96 | 
cline_96_0:			/* LN: 97 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x208)			# LN: 97 | 
	i1 = i7 - (0x20e)			# LN: 97 | 
	a0 = xmem[i1]			# LN: 97 | 
	i0 = xmem[i0]			# LN: 97 | 
	call (_cl_wavwrite_sendsample)			# LN: 97 | 
cline_97_0:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
init_latch_label_2:			/* LN: 98 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20d)			# LN: 94 | 
	a0 = xmem[i0]			# LN: 94 | 
	uhalfword(a1) = (0x1)			# LN: 94 | 
	a0 = a0 + a1			# LN: 94 | 
	i0 = i7 - (0x20d)			# LN: 94 | 
label_end_93:			# LN: 94 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 94 | 
cline_94_1:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
init_latch_label_3:			/* LN: 99 | CYCLE: 0 | RULES: () */ 
for_end_4:			/* LN: 94 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20c)			# LN: 92 | 
	a0 = xmem[i0]			# LN: 92 | 
	uhalfword(a1) = (0x1)			# LN: 92 | 
	a0 = a0 + a1			# LN: 92 | 
	i0 = i7 - (0x20c)			# LN: 92 | 
label_end_94:			# LN: 92 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 92 | 
cline_92_1:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
init_latch_label_4:			/* LN: 100 | CYCLE: 0 | RULES: () */ 
for_end_3:			/* LN: 92 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x20b)			# LN: 75 | 
	a0 = xmem[i0]			# LN: 75 | 
	uhalfword(a1) = (0x1)			# LN: 75 | 
	a0 = a0 + a1			# LN: 75 | 
	i0 = i7 - (0x20b)			# LN: 75 | 
	xmem[i0] = a0h			# LN: 75 | 
	jmp (for_0)			# LN: 75 | 
cline_75_1:			/* LN: 107 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 75 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x103)			# LN: 107 | 
	i0 = xmem[i0]			# LN: 107 | 
	call (_cl_wavread_close)			# LN: 107 | 
cline_107_0:			/* LN: 108 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x208)			# LN: 108 | 
	i0 = xmem[i0]			# LN: 108 | 
	call (_cl_wavwrite_close)			# LN: 108 | 
cline_108_0:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 111 | 
	jmp (__epilogue_234)			# LN: 111 | 
cline_111_0:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
__epilogue_234:			/* LN: 112 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x20e)			# LN: 112 | 
	i7 -= 1			# LN: 112 | 
	ret			# LN: 112 | 

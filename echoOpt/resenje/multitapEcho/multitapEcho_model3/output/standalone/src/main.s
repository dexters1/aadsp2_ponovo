	.public _echoState
	.public _echo_buffer
	.public _initial_delay
	.public _initial_gain
	.public _initial_input_gain
	.public _sampleBuffer
	.public _tap_gain_ymem
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
	.extern _multitap_echo
	.public _multitap_echo1
	.public _multitap_echo_init
	.extern _printf
	.extern _strcpy
	.extern __div
	.xdata_ovly
S_echoState_0	.struct
_pEchoBuff	.dw (0x0)
_bufferLength	.dw (0x0)
_writePointer	.dw (0x0)
_readPointer	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
_delay	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
	.dw (0x0)
_input_gain	.dw (0x0)
_tap_gain	.dw (0x0)
_n_tap	.dw (0x0)
	.endstruct

	.xdata_ovly
_echoState S_echoState_0

	.xdata_ovly align 4096
_echo_buffer
	.bss (0x1000)
	.xdata_ovly
_initial_delay
	.dw  (0x400)
	.dw  (0x600)
	.dw  (0xa00)
	.dw  (0xc00)
	.xdata_ovly
_initial_gain
	.dw  (0x20000000)
	.dw  (0x10000000)
	.dw  (0x8000000)
	.dw  (0x8000000)
	.xdata_ovly
_initial_input_gain
	.dw  (0x40000000)
	.ydata_ovly
_sampleBuffer
	.bss (0x80)
	.xdata_ovly
_string_const_0
	.dw  (0x2e)
	.dw  (0x2e)
	.dw  (0x2f)
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
	.dw  (0x73)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x65)
	.dw  (0x63)
	.dw  (0x68)
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
	.dw  (0x4f)
	.dw  (0x75)
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
	.dw  (0x5f)
	.dw  (0x73)
	.dw  (0x70)
	.dw  (0x65)
	.dw  (0x65)
	.dw  (0x63)
	.dw  (0x68)
	.dw  (0x5f)
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
	.ydata_ovly
_tap_gain_ymem
	.bss (0x4)
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

_main:			/* LN: 166 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = a2g; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = a2h; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = a2l; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = i3; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = a3g; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = a3h; i7 += 1			# LN: 166, 166 | 
	xmem[i7] = a3l; i7 += 1			# LN: 166, 166 | 
	i7 = i7 + (0x200)			# LN: 166 | 
	i0 = i7 - (256 - 0)			# LN: 181 | 
	i1 = (0) + (_string_const_0)			# LN: 181 | 
	call (_strcpy)			# LN: 181 | 
	i0 = i7 - (256 - 0)			# LN: 182 | 
	call (_cl_wavread_open)			# LN: 182 | 
	AnyReg(i2, a0h)			# LN: 182 | 
	a0 = i2			# LN: 183 | 
	a0 & a0			# LN: 183 | 
	if (a != 0) jmp (else_0)			# LN: 183 | 
	i0 = (0) + (_string_const_1)			# LN: 185 | 
	call (_printf)			# LN: 185 | 
	halfword(a0) = (0xffff)			# LN: 186 | 
	jmp (__epilogue_228)			# LN: 186 | 
endif_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 183 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 192 | 
	call (_cl_wavread_getnchannels)			# LN: 192 | 
	a2 =+ a0			# LN: 192 | 
	i0 = i2			# LN: 193 | 
	call (_cl_wavread_bits_per_sample)			# LN: 193 | 
	a1 =+ a0			# LN: 193 | 
	i0 = i2			# LN: 194 | 
	call (_cl_wavread_frame_rate)			# LN: 194 | 
	b0 =+ a0			# LN: 194 | 
	i0 = i2			# LN: 195 | 
	call (_cl_wavread_number_of_frames)			# LN: 195 | 
	i0 = i7 - (512 - 0)			# LN: 200 | 
	i1 = (0) + (_string_const_2)			# LN: 200 | 
	b1 =+ a0			# LN: 195 | 
	call (_strcpy)			# LN: 200 | 
	i0 = i7 - (512 - 0)			# LN: 201 | 
	a0 =+ a1			# LN: 201 | 
	a1 =+ a2			# LN: 201 | 
	call (_cl_wavwrite_open)			# LN: 201 | 
	AnyReg(i3, a0h)			# LN: 201 | 
	a0 = i3			# LN: 202 | 
	a0 & a0			# LN: 202 | 
	if (a != 0) jmp (else_1)			# LN: 202 | 
	i0 = (0) + (_string_const_3)			# LN: 204 | 
	call (_printf)			# LN: 204 | 
	halfword(a0) = (0xffff)			# LN: 205 | 
	jmp (__epilogue_228)			# LN: 205 | 
endif_1:			/* LN: 202 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 202 | CYCLE: 0 | RULES: () */ 
	call (_multitap_echo_init)			# LN: 212 | 
	uhalfword(a1) = (0x10)			# LN: 223 | 
	a0 =+ b1			# LN: 223 | 
	call (__div)			# LN: 223 | 
	AnyReg(i0, a0h)			# LN: 225 | 
	nop #empty cycle
	do (i0), label_end_100			# LN: 225 | 
label_begin_100:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
	a3 = 0			# LN: 227 | 
	do (0x10), label_end_97			# LN: 227 | 
label_begin_97:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	AnyReg(i0, a2h)			# LN: 229 | 
	b0 = 0			# LN: 229 | 
	do (i0), label_end_96			# LN: 229 | 
label_begin_96:			/* LN: 229 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 231 | 
	call (_cl_wavread_recvsample)			# LN: 231 | 
	a1 =+ a0; b1 =+ b0			# LN: 231, 232 | 
	b1 = b1 << 4			# LN: 232 | 
	i0 = b1; a0 =+ a1			# LN: 232, 232 | 
	uhalfword(a1) = (0x1)			# LN: 229 | 
	i0 = i0 + (_sampleBuffer + 0)			# LN: 232 | 
	b1 = i0; b0 = b0 + a1			# LN: 232, 229 | 
	a1 = a3 + b1			# LN: 232 | 
	AnyReg(i0, a1h)			# LN: 232 | 
	nop #empty cycle
label_end_96:			# LN: 229 | CYCLE: 11 | RULES: ()
	ymem[i0] = a0h			# LN: 232 | 
init_latch_label_5:			/* LN: 234 | CYCLE: 0 | RULES: () */ 
for_end_6:			/* LN: 229 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 227 | 
label_end_97:			# LN: 227 | CYCLE: 1 | RULES: ()
	a3 = a3 + a0			# LN: 227 | 
for_end_5:			/* LN: 227 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_sampleBuffer + 0)			# LN: 240 | 
	i1 = (0) + (_sampleBuffer + 0)			# LN: 240 | 
	call (_multitap_echo)			# LN: 240 | 
	a1 = 0			# LN: 243 | 
	do (0x10), label_end_99			# LN: 243 | 
label_begin_99:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
	AnyReg(i0, a2h)			# LN: 245 | 
	b0 = 0			# LN: 245 | 
	do (i0), label_end_98			# LN: 245 | 
label_begin_98:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	a0 =+ b0			# LN: 247 | 
	a0 = a0 << 4			# LN: 247 | 
	i1 = a0			# LN: 247 | 
	i0 = i3			# LN: 248 | 
	i1 = i1 + (_sampleBuffer + 0)			# LN: 247 | 
	a0 = i1			# LN: 247 | 
	a0 = a0 + a1			# LN: 247 | 
	AnyReg(i1, a0h)			# LN: 247 | 
	uhalfword(a0) = (0x1)			# LN: 245 | 
	b1 = ymem[i1]; b0 = b0 + a0			# LN: 247, 245 | 
	a0 =+ b1			# LN: 247 | 
label_end_98:			# LN: 245 | CYCLE: 11 | RULES: ()
	call (_cl_wavwrite_sendsample)			# LN: 248 | 
init_latch_label_7:			/* LN: 250 | CYCLE: 0 | RULES: () */ 
for_end_8:			/* LN: 245 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 243 | 
label_end_99:			# LN: 243 | CYCLE: 1 | RULES: ()
	a1 = a1 + a0			# LN: 243 | 
init_latch_label_8:			/* LN: 251 | CYCLE: 0 | RULES: () */ 
for_end_7:			/* LN: 243 | CYCLE: 0 | RULES: () */ 
label_end_100:			# LN: 225 | CYCLE: 0 | RULES: ()
	nop #empty cycle
for_end_4:			/* LN: 225 | CYCLE: 0 | RULES: () */ 
	i0 = i2			# LN: 256 | 
	call (_cl_wavread_close)			# LN: 256 | 
	i0 = i3			# LN: 257 | 
	call (_cl_wavwrite_close)			# LN: 257 | 
	a0 = 0			# LN: 260 | 
__epilogue_228:			/* LN: 261 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x200)			# LN: 261 | 
	i7 -= 1			# LN: 261 | 
	a3l = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a3h = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a3g = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a2l = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a2h = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	a2g = xmem[i7]; i7 -= 1			# LN: 261, 261 | 
	i2 = xmem[i7]			# LN: 261 | 
	ret			# LN: 261 | 



_multitap_echo1:			/* LN: 119 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2; i7 += 1			# LN: 119, 119 | 
	xmem[i7] = i3; i7 += 1			# LN: 119, 119 | 
	i4 = xmem[_echoState + 2]			# LN: 122 | 
	x0 = xmem[_echoState + 11]			# LN: 123 | 
	i5 = xmem[_echoState + 12]			# LN: 124 | 
	i2 = (0) + (_echoState + 3)			# LN: 125 | 
	do (0x10), label_end_95			# LN: 127 | 
label_begin_95:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	x1 = ymem[i0]			# LN: 129 | 
	a0 = ymem[i0]; i0 += 1; a1 = x1 * x0			# LN: 132, 132, 129 | 
	xmem[i4] = a0h			# LN: 132 | 
	nm4 = (0xb001)			# LN: -1 | 
	a0 = xmem[_echoState + 13]			# LN: 135 | 
	i4 += n			# LN: 133 | 
	AnyReg(i3, a0h)			# LN: 135 | 
	nm4 = (0x0)			# LN: -1 | 
	do (i3), label_end_94			# LN: 135 | 
label_begin_94:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i3 = xmem[i2]			# LN: 137 | 
	x1 = ymem[i5]; i5 += 1			# LN: 138, 138 | 
	nm3 = (0xb001)			# LN: -1 | 
	y0 = xmem[i3]			# LN: 138 | 
	i3 += n; a1 += x1 * y0			# LN: 139, 138 | 
	nm3 = (0x0)			# LN: -1 | 
label_end_94:			# LN: 135 | CYCLE: 6 | RULES: ()
	xmem[i2] = i3; i2 += 1			# LN: 139, 140 | 
for_end_3:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	i5 = i5 - (0x4)			# LN: 143 | 
	i2 = i2 - (0x4)			# LN: 144 | 
label_end_95:			# LN: 127 | CYCLE: 2 | RULES: ()
	ymem[i1] = a1; i1 += 1			# LN: 146, 146 | 
for_end_2:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	xmem[_echoState + 2] = i4			# LN: 149 | 
	i7 -= 1			# LN: 150 | 
	i3 = xmem[i7]; i7 -= 1			# LN: 150, 150 | 
	i2 = xmem[i7]			# LN: 150 | 
	ret			# LN: 150 | 



_multitap_echo_init:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i2; i7 += 1			# LN: 71, 71 | 
	xmem[i7] = i3			# LN: 71 | 
	i0 = (0) + (_echo_buffer + 0)			# LN: 74 | 
	i1 = (0) + (_echoState + 7)			# LN: 76 | 
	i4 = (0) + (_initial_delay + 0)			# LN: 77 | 
	i5 = (0) + (_initial_gain + 0)			# LN: 79 | 
	i2 = (0x1000)			# LN: 83 | 
	i3 = (0) + (_echoState + 3)			# LN: 80 | 
	do (i2), label_end_92			# LN: 83 | 
label_begin_92:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 85 | 
label_end_92:			# LN: 83 | CYCLE: 1 | RULES: ()
	xmem[i0] = a0h; i0 += 1			# LN: 85, 85 | 
for_end_0:			/* LN: 83 | CYCLE: 0 | RULES: () */ 
	i0 = (0) + (_tap_gain_ymem + 0)			# LN: 88 | 
	xmem[_echoState + 12] = i0			# LN: 88 | 
	i0 = (0) + (_echo_buffer + 0)			# LN: 89 | 
	xmem[_echoState + 0] = i0			# LN: 89 | 
	uhalfword(a0) = (0x1000)			# LN: 90 | 
	xmem[_echoState + 1] = a0h			# LN: 90 | 
	i0 = xmem[_echoState + 0]			# LN: 91 | 
	a0 = (0x4000)			# LN: 92 | 
	i0 = i0 + (0x1000)			# LN: 91 | 
	i0 -= 1			# LN: 91 | 
	xmem[_echoState + 2] = i0			# LN: 91 | 
	xmem[_echoState + 11] = a0h			# LN: 92 | 
	uhalfword(a0) = (0x4)			# LN: 93 | 
	xmem[_echoState + 13] = a0h			# LN: 93 | 
	i0 = xmem[_echoState + 12]			# LN: 94 | 
	do (0x4), label_end_93			# LN: 95 | 
label_begin_93:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[i4]			# LN: 97 | 
	uhalfword(a1) = (_echo_buffer + 4095)			# LN: 97 | 
	a1 = xmem[i4]; i4 += 1; a0 = a1 - a0			# LN: 98, 98, 97 | 
	AnyReg(i2, a0h)			# LN: 97 | 
	xmem[i3] = i2; i3 += 1			# LN: 97, 97 | 
	xmem[i1] = a1h; i1 += 1			# LN: 98, 98 | 
	a0 = xmem[i5]; i5 += 1			# LN: 99, 99 | 
label_end_93:			# LN: 95 | CYCLE: 7 | RULES: ()
	ymem[i0] = a0h; i0 += 1			# LN: 99, 99 | 
for_end_1:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i3 = xmem[i7]; i7 -= 1			# LN: 101, 101 | 
	i2 = xmem[i7]			# LN: 101 | 
	ret			# LN: 101 | 

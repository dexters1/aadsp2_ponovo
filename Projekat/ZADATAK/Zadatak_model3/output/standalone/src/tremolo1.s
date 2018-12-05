	.public _data
	.public _g_lfo_scale
	.public _init
	.public _lfo
	.public _processBlock
	.extern __int_to_laccum
	.extern __mul_sat_laccum
	.xdata_ovly
__extractedConst_0_9
	.dw  (0x7fffffff)
	.xdata_ovly
_data
	.bss (0x7)
	.xdata_ovly
_g_lfo_scale
	.dw  (0x1)
	.code_ovly



_init:			/* LN: 65 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 65 | 
	i7 += 1			# LN: 65 | 
cline_65_0:			/* LN: 68 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 68 | 
	xmem[_data + 1] = a0h			# LN: 68 | 
cline_68_0:			/* LN: 69 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 69 | 
	xmem[_data + 2] = a0h			# LN: 69 | 
cline_69_0:			/* LN: 70 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0x1)			# LN: 70 | 
	xmem[_data + 3] = a0h			# LN: 70 | 
cline_70_0:			/* LN: 71 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 71 | 
	xmem[_data + 4] = a0h			# LN: 71 | 
cline_71_0:			/* LN: 72 | CYCLE: 0 | RULES: () */ 
	uhalfword(a0) = (0xaec3)			# LN: 72 | 
	xmem[_data + 5] = a0h			# LN: 72 | 
cline_72_0:			/* LN: 73 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 4]			# LN: 73 | 
	xmem[_data + 6] = a0h			# LN: 73 | 
cline_73_0:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_104)			# LN: 74 | 
__epilogue_104:			/* LN: 74 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 74 | 
	ret			# LN: 74 | 



_lfo:			/* LN: 131 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 131 | 
	i7 += 1			# LN: 131 | 
cline_131_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
switch_0:			/* LN: 133 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 3]			# LN: 133 | 
	a0 & a0			# LN: 133 | 
	if (a == 0) jmp (case_0)			# LN: 133 | 
	uhalfword(a1) = (0x1)			# LN: 133 | 
	a0 - a1			# LN: 133 | 
	if (a == 0) jmp (case_1)			# LN: 133 | 
	jmp (default_0)			# LN: 133 | 
cline_133_0:			/* LN: 136 | CYCLE: 0 | RULES: () */ 
case_0:			/* LN: 135 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 136 | 
	a1 = (0x2000)			# LN: 136 | 
	a0 - a1			# LN: 136 | 
	if (a >= 0) jmp (else_1)			# LN: 136 | 
cline_136_0:			/* LN: 138 | CYCLE: 0 | RULES: () */ 
	x0 = xmem[_data + 6]			# LN: 138 | 
	x1 = xmem[__extractedConst_0_9 + 0]			# LN: 138 | 
	uhalfword(a0) = (0x2)			# LN: 138 | 
	b0 = x1 * x0			# LN: 138 | 
	call (__int_to_laccum)			# LN: 138 | 
	a1 =+ b0; b1 =+ a0			# LN: 138, 138 | 
	a0 =+ b1			# LN: 138 | 
	call (__mul_sat_laccum)			# LN: 138 | 
	a1 = (0x4000)			# LN: 138 | 
	a0 = a1 + a0			# LN: 138 | 
	a0 = a0			# LN: 138 | 
	jmp (__epilogue_108)			# LN: 138 | 
cline_138_0:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
else_1:			/* LN: 136 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 140 | 
	a1 = (0x6000)			# LN: 140 | 
	a0 - a1			# LN: 140 | 
	if (a >= 0) jmp (else_2)			# LN: 140 | 
cline_140_0:			/* LN: 142 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 142 | 
	a1 = (0x2000)			# LN: 142 | 
	a0 = a0 - a1			# LN: 142 | 
	x0 = xmem[__extractedConst_0_9 + 0]			# LN: 142 | 
	uhalfword(a1) = (0x2)			# LN: 142 | 
	x1 = a0h; a0 =+ a1			# LN: 142, 142 | 
	b0 = x0 * x1			# LN: 142 | 
	call (__int_to_laccum)			# LN: 142 | 
	a1 =+ b0; b1 =+ a0			# LN: 142, 142 | 
	a0 =+ b1			# LN: 142 | 
	call (__mul_sat_laccum)			# LN: 142 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 142 | 
	a0 = a1 - a0			# LN: 142 | 
	a0 = a0			# LN: 142 | 
	jmp (__epilogue_108)			# LN: 142 | 
cline_142_0:			/* LN: 146 | CYCLE: 0 | RULES: () */ 
else_2:			/* LN: 140 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 146 | 
	a1 = (0x6000)			# LN: 146 | 
	a0 = a0 - a1			# LN: 146 | 
	x0 = a0h			# LN: 146 | 
	x1 = xmem[__extractedConst_0_9 + 0]			# LN: 146 | 
	a0 = x1 * x0			# LN: 146 | 
	a0 = a0 << 1			# LN: 146 | 
	a0 = a0			# LN: 146 | 
	jmp (__epilogue_108)			# LN: 146 | 
cline_133_1:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
case_1:			/* LN: 149 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 150 | 
	a1 = (0x4000)			# LN: 150 | 
	a0 - a1			# LN: 150 | 
	if (a >= 0) jmp (else_3)			# LN: 150 | 
cline_150_0:			/* LN: 153 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 153 | 
	jmp (__epilogue_108)			# LN: 153 | 
cline_153_0:			/* LN: 157 | CYCLE: 0 | RULES: () */ 
else_3:			/* LN: 150 | CYCLE: 0 | RULES: () */ 
	a0 = 0			# LN: 157 | 
	jmp (__epilogue_108)			# LN: 157 | 
cline_133_2:			/* LN: 160 | CYCLE: 0 | RULES: () */ 
default_0:			/* LN: 159 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[__extractedConst_0_9 + 0]			# LN: 160 | 
	jmp (__epilogue_108)			# LN: 160 | 
cline_133_3:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
__epilogue_108:			/* LN: 162 | CYCLE: 0 | RULES: () */ 
	i7 -= 1			# LN: 162 | 
	ret			# LN: 162 | 



_processBlock:			/* LN: 78 | CYCLE: 0 | RULES: () */ 
	xmem[i7] = i7			# LN: 78 | 
	i7 += 1			# LN: 78 | 
	i7 = i7 + (0x7)			# LN: 78 | 
	i4 = i7 - (0x1)			# LN: 78 | 
	xmem[i4] = i0			# LN: 78 | 
	i0 = i7 - (0x2)			# LN: 78 | 
	xmem[i0] = i1			# LN: 78 | 
cline_78_0:			/* LN: 88 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x1)			# LN: 88 | 
	a0 = xmem[i0]			# LN: 88 | 
	i0 = i7 - (0x3)			# LN: 88 | 
	xmem[i0] = a0			# LN: 88 | 
cline_88_0:			/* LN: 89 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x2)			# LN: 89 | 
	a0 = xmem[i0]			# LN: 89 | 
	i0 = i7 - (0x4)			# LN: 89 | 
	xmem[i0] = a0			# LN: 89 | 
cline_89_0:			/* LN: 93 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 4]			# LN: 93 | 
	xmem[_data + 6] = a0h			# LN: 93 | 
cline_93_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 95 | 
	a0 = 0			# LN: 95 | 
	xmem[i0] = a0h			# LN: 95 | 
	do (0x10), label_end_92			# LN: 95 | 
cline_95_0:			/* LN: 100 | CYCLE: 0 | RULES: () */ 
label_begin_92:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	y0 = xmem[_data + 2]			# LN: 100 | 
	call (_lfo)			# LN: 100 | 
	a1 = xmem[__extractedConst_0_9 + 0]			# LN: 100 | 
	x0 = a0h; a0 =+ a1			# LN: 100, 100 | 
	a0 -= y0 * x0			# LN: 100 | 
	i0 = i7 - (0x6)			# LN: 100 | 
	xmem[i0] = a0			# LN: 100 | 
cline_100_0:			/* LN: 102 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 102 | 
	i0 = xmem[i0]			# LN: 102 | 
	i1 = i7 - (0x6)			# LN: 102 | 
	x0 = xmem[i0]			# LN: 102 | 
	x1 = xmem[i1]			# LN: 102 | 
	i0 = i7 - (0x4)			# LN: 102 | 
	i0 = xmem[i0]			# LN: 102 | 
	a0 = x0 * x1			# LN: 102 | 
	xmem[i0] = a0			# LN: 102 | 
cline_102_0:			/* LN: 106 | CYCLE: 0 | RULES: () */ 
	x0 = xmem[_data + 1]			# LN: 106 | 
	x1 = xmem[_data + 5]			# LN: 106 | 
	a0 = x0 * x1			# LN: 106 | 
	i0 = i7 - (0x7)			# LN: 106 | 
	xmem[i0] = a0			# LN: 106 | 
cline_106_0:			/* LN: 109 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 109 | 
	i0 = i7 - (0x7)			# LN: 109 | 
	a1 = xmem[i0]; a0 = a0 >> 1			# LN: 109, 109 | 
	a0 = a0 + a1			# LN: 109 | 
	xmem[_data + 6] = a0h			# LN: 109 | 
cline_109_0:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 111 | 
	a1 = (0x4000)			# LN: 111 | 
	a0 - a1			# LN: 111 | 
	if (a < 0) jmp (else_0)			# LN: 111 | 
cline_111_0:			/* LN: 113 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 113 | 
	a1 = (0x4000)			# LN: 113 | 
	a0 = a0 - a1			# LN: 113 | 
	xmem[_data + 6] = a0h			# LN: 113 | 
	jmp (endif_0)			# LN: 113 | 
cline_113_0:			/* LN: 116 | CYCLE: 0 | RULES: () */ 
endif_0:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
else_0:			/* LN: 111 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 116 | 
	a0 = a0 << 1			# LN: 116 | 
	xmem[_data + 6] = a0h			# LN: 116 | 
cline_116_0:			/* LN: 120 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x4)			# LN: 120 | 
	i0 = xmem[i0]			# LN: 120 | 
	i1 = i7 - (0x4)			# LN: 120 | 
	i0 += 1			# LN: 120 | 
	xmem[i1] = i0			# LN: 120 | 
cline_120_0:			/* LN: 121 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x3)			# LN: 121 | 
	i0 = xmem[i0]			# LN: 121 | 
	i1 = i7 - (0x3)			# LN: 121 | 
	i0 += 1			# LN: 121 | 
	xmem[i1] = i0			# LN: 121 | 
cline_121_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
init_latch_label_0:			/* LN: 122 | CYCLE: 0 | RULES: () */ 
	i0 = i7 - (0x5)			# LN: 95 | 
	a0 = xmem[i0]			# LN: 95 | 
	uhalfword(a1) = (0x1)			# LN: 95 | 
	a0 = a0 + a1			# LN: 95 | 
	i0 = i7 - (0x5)			# LN: 95 | 
label_end_92:			# LN: 95 | CYCLE: 5 | RULES: ()
	xmem[i0] = a0h			# LN: 95 | 
cline_95_1:			/* LN: 126 | CYCLE: 0 | RULES: () */ 
for_end_0:			/* LN: 95 | CYCLE: 0 | RULES: () */ 
	a0 = xmem[_data + 6]			# LN: 126 | 
	xmem[_data + 4] = a0h			# LN: 126 | 
cline_126_0:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	jmp (__epilogue_106)			# LN: 127 | 
__epilogue_106:			/* LN: 127 | CYCLE: 0 | RULES: () */ 
	i7 = i7 - (0x7)			# LN: 127 | 
	i7 -= 1			# LN: 127 | 
	ret			# LN: 127 | 

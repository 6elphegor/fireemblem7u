	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_InitBlendAmt
CgText_InitBlendAmt: @ 0x08087A38
	adds r0, #0x56
	movs r1, #0
	strb r1, [r0]
	bx lr

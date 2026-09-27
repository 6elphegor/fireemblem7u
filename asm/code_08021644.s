	.include "macro.inc"

	.syntax unified

	thumb_func_start EffectWait
EffectWait: @ 0x08021644
	ldr r1, _08021650 @ =0x0203A85C
	movs r0, #1
	strb r0, [r1, #0x11]
	movs r0, #0x17
	bx lr
	.align 2, 0
_08021650: .4byte 0x0203A85C

	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetClassReelSpell
ResetClassReelSpell: @ 0x08063FE0
	ldr r0, _08063FEC @ =0x0203E0F4
	movs r1, #0
	str r1, [r0]
	ldr r0, _08063FF0 @ =0x0203E0F8
	str r1, [r0]
	bx lr
	.align 2, 0
_08063FEC: .4byte 0x0203E0F4
_08063FF0: .4byte 0x0203E0F8

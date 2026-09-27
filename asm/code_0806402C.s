	.include "macro.inc"

	.syntax unified

	thumb_func_start SetActiveClassReelSpell
SetActiveClassReelSpell: @ 0x0806402C
	ldr r1, _08064034 @ =0x0203E0F4
	str r0, [r1]
	bx lr
	.align 2, 0
_08064034: .4byte 0x0203E0F4

	.include "macro.inc"

	.syntax unified

	thumb_func_start AiIsUnitNonActive
AiIsUnitNonActive: @ 0x08037944
	ldr r1, _08037950 @ =0x03004690
	ldr r1, [r1]
	cmp r0, r1
	beq _08037954
	movs r0, #1
	b _08037956
	.align 2, 0
_08037950: .4byte 0x03004690
_08037954:
	movs r0, #0
_08037956:
	bx lr

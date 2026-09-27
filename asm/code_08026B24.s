	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitAffinityIcon
GetUnitAffinityIcon: @ 0x08026B24
	ldr r0, [r0]
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _08026B30
	adds r0, #0x79
	b _08026B34
_08026B30:
	movs r0, #1
	rsbs r0, r0, #0
_08026B34:
	bx lr
	.align 2, 0

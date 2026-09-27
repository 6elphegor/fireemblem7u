	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitInitialSupportExp
GetUnitInitialSupportExp: @ 0x080267F4
	ldr r0, [r0]
	ldr r0, [r0, #0x2c]
	cmp r0, #0
	beq _08026804
	adds r0, #7
	adds r0, r0, r1
	ldrb r0, [r0]
	b _08026808
_08026804:
	movs r0, #1
	rsbs r0, r0, #0
_08026808:
	bx lr
	.align 2, 0

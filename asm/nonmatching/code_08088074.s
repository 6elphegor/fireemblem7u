	.include "macro.inc"

	.syntax unified

	thumb_func_start DoesStringContainTact
DoesStringContainTact: @ 0x08088074
	ldrb r1, [r0]
	cmp r1, #0
	beq _08088080
	cmp r1, #0x80
	beq _08088084
	b _08088090
_08088080:
	movs r0, #0
	b _08088094
_08088084:
	adds r0, #1
	ldrb r1, [r0]
	cmp r1, #0x20
	bne _08088090
	movs r0, #1
	b _08088094
_08088090:
	adds r0, #1
	b DoesStringContainTact
_08088094:
	bx lr
	.align 2, 0

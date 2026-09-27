	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803483C
sub_0803483C: @ 0x0803483C
	cmp r0, #0
	beq _08034846
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _0803484A
_08034846:
	movs r1, #0
	b _0803484C
_0803484A:
	movs r1, #1
_0803484C:
	cmp r1, #0
	beq _08034858
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803485A
_08034858:
	movs r0, #0
_0803485A:
	bx lr

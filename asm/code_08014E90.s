	.include "macro.inc"

	.syntax unified

	thumb_func_start MemCpy
MemCpy: @ 0x08014E90
	adds r3, r0, #0
	cmp r2, #0
	beq _08014EA4
_08014E96:
	ldrb r0, [r3]
	strb r0, [r1]
	adds r1, #1
	adds r3, #1
	subs r2, #1
	cmp r2, #0
	bne _08014E96
_08014EA4:
	bx lr
	.align 2, 0

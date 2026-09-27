	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080347F8
sub_080347F8: @ 0x080347F8
	adds r1, r0, #0
	cmp r1, #0
	beq _08034804
	ldrb r0, [r1, #2]
	cmp r0, #1
	beq _08034808
_08034804:
	movs r0, #0
	b _0803480A
_08034808:
	movs r0, #1
_0803480A:
	cmp r0, #0
	beq _0803481A
	movs r0, #6
	ldrsb r0, [r1, r0]
	lsls r0, r0, #8
	ldrb r1, [r1, #3]
	orrs r0, r1
	b _0803481C
_0803481A:
	movs r0, #0
_0803481C:
	bx lr
	.align 2, 0

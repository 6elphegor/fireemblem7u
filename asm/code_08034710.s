	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSomeBallistaItemAt
GetSomeBallistaItemAt: @ 0x08034710
	push {lr}
	bl GetTrapAt
	cmp r0, #0
	beq _08034720
	ldrb r1, [r0, #2]
	cmp r1, #1
	beq _08034724
_08034720:
	movs r1, #0
	b _08034726
_08034724:
	movs r1, #1
_08034726:
	cmp r1, #0
	beq _08034730
	ldrb r1, [r0, #3]
	cmp r1, #0
	bne _08034734
_08034730:
	movs r0, #0
	b _0803473A
_08034734:
	movs r0, #0x80
	lsls r0, r0, #1
	adds r0, r1, r0
_0803473A:
	pop {r1}
	bx r1
	.align 2, 0

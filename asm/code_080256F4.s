	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitSpritePalette
GetUnitSpritePalette: @ 0x080256F4
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0x40
	beq _0802571A
	cmp r1, #0x40
	bgt _08025708
	cmp r1, #0
	beq _08025712
	b _08025720
_08025708:
	cmp r1, #0x80
	beq _08025716
	cmp r1, #0xc0
	beq _0802571E
	b _08025720
_08025712:
	movs r0, #0xc
	b _08025720
_08025716:
	movs r0, #0xd
	b _08025720
_0802571A:
	movs r0, #0xe
	b _08025720
_0802571E:
	movs r0, #0xb
_08025720:
	bx lr
	.align 2, 0

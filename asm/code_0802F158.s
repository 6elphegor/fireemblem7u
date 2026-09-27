	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaIsUnitAllowed
ArenaIsUnitAllowed: @ 0x0802F158
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _0802F178
	adds r0, r2, #0
	bl GetUnitBestWRankType
	cmp r0, #0
	blt _0802F178
	movs r0, #1
	b _0802F17A
_0802F178:
	movs r0, #0
_0802F17A:
	pop {r1}
	bx r1
	.align 2, 0

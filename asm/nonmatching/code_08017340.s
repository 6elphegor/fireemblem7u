	.include "macro.inc"

	.syntax unified

	thumb_func_start GetItemCost
GetItemCost: @ 0x08017340
	adds r3, r0, #0
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017360 @ =0x08BE222C
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017364
	ldrh r0, [r2, #0x1a]
	b _0801736A
	.align 2, 0
_08017360: .4byte 0x08BE222C
_08017364:
	asrs r0, r3, #8
	ldrh r2, [r2, #0x1a]
	muls r0, r2, r0
_0801736A:
	bx lr

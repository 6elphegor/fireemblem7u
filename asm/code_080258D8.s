	.include "macro.inc"

	.syntax unified

	thumb_func_start AddUnitSprite
AddUnitSprite: @ 0x080258D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, _080258F4 @ =0x02039F1C
	ldr r3, _080258F8 @ =0x0203A3CC
_080258E0:
	ldr r1, [r2]
	cmp r1, #0
	beq _080258FC
	movs r5, #6
	ldrsh r0, [r1, r5]
	cmp r0, r4
	blt _080258FC
	adds r2, r1, #0
	b _080258E0
	.align 2, 0
_080258F4: .4byte 0x02039F1C
_080258F8: .4byte 0x0203A3CC
_080258FC:
	ldr r0, [r3]
	str r1, [r0]
	str r0, [r2]
	adds r1, r0, #0
	adds r1, #0xc
	str r1, [r3]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

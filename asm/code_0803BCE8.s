	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803BCE8
sub_0803BCE8: @ 0x0803BCE8
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl sub_0803BFF4
	ldr r0, _0803BD2C @ =0x08B98AE8
	movs r1, #0
	adds r2, r4, #0
	bl AiFindClosestTerrainAdjacentPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803BD34
	adds r0, r5, #0
	bl sub_0803BED0
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803BD30 @ =0x0202E3E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	bgt _0803BD34
	movs r0, #1
	b _0803BD36
	.align 2, 0
_0803BD2C: .4byte 0x08B98AE8
_0803BD30: .4byte 0x0202E3E8
_0803BD34:
	movs r0, #0
_0803BD36:
	pop {r4, r5}
	pop {r1}
	bx r1

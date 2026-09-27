	.include "macro.inc"

	.syntax unified

	thumb_func_start AiSetMovCostTableWithPassableWalls
AiSetMovCostTableWithPassableWalls: @ 0x0803BE04
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r2, #1
	ldr r3, _0803BE24 @ =0x030043F0
	movs r5, #1
_0803BE0E:
	adds r0, r4, r2
	ldrb r1, [r0]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0803BE28
	adds r0, r2, r3
	strb r1, [r0]
	b _0803BE2C
	.align 2, 0
_0803BE24: .4byte 0x030043F0
_0803BE28:
	adds r0, r2, r3
	strb r5, [r0]
_0803BE2C:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0x40
	bls _0803BE0E
	pop {r4, r5}
	pop {r0}
	bx r0

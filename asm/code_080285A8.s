	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleRoll2RN
BattleRoll2RN: @ 0x080285A8
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _080285C8 @ =0x0203A3D8
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080285CC
	adds r0, r3, #0
	bl RandRoll2Rn
	lsls r0, r0, #0x18
	b _080285CE
	.align 2, 0
_080285C8: .4byte 0x0203A3D8
_080285CC:
	lsls r0, r2, #0x18
_080285CE:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

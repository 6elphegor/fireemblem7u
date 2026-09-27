	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleRoll1RN
BattleRoll1RN: @ 0x0802857C
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	ldr r1, _0802859C @ =0x0203A3D8
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080285A0
	adds r0, r3, #0
	bl RandRoll
	lsls r0, r0, #0x18
	b _080285A2
	.align 2, 0
_0802859C: .4byte 0x0203A3D8
_080285A0:
	lsls r0, r2, #0x18
_080285A2:
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

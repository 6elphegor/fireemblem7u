	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleGetFollowUpOrder
BattleGetFollowUpOrder: @ 0x0802903C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _08029070 @ =0x0203A470
	adds r2, r0, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r2, r3]
	adds r6, r0, #0
	cmp r1, #0xfa
	bgt _080290AE
	ldr r0, _08029074 @ =0x0203A3F0
	adds r1, r0, #0
	adds r1, #0x5e
	movs r5, #0
	ldrsh r3, [r1, r5]
	movs r1, #0
	ldrsh r2, [r2, r1]
	subs r1, r3, r2
	adds r5, r0, #0
	cmp r1, #0
	blt _08029078
	cmp r1, #3
	ble _080290AE
	b _0802907E
	.align 2, 0
_08029070: .4byte 0x0203A470
_08029074: .4byte 0x0203A3F0
_08029078:
	subs r0, r2, r3
	cmp r0, #3
	ble _080290AE
_0802907E:
	adds r0, r5, #0
	adds r0, #0x5e
	adds r2, r6, #0
	adds r2, #0x5e
	movs r3, #0
	ldrsh r1, [r0, r3]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08029098
	str r5, [r4]
	str r6, [r7]
	b _0802909C
_08029098:
	str r6, [r4]
	str r5, [r7]
_0802909C:
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #3
	beq _080290AE
	movs r0, #1
	b _080290B0
_080290AE:
	movs r0, #0
_080290B0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

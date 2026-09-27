	.include "macro.inc"

	.syntax unified

	thumb_func_start WeaponSelectMenu_Draw
WeaponSelectMenu_Draw: @ 0x08021C38
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	ldr r0, _08021C80 @ =0x03004690
	ldr r0, [r0]
	adds r1, #0x3c
	movs r2, #0
	ldrsb r2, [r1, r2]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	adds r2, r0, #0
	adds r0, r5, #0
	adds r0, #0x34
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r1, #0x2c
	ldrsh r3, [r5, r1]
	lsls r3, r3, #5
	movs r6, #0x2a
	ldrsh r1, [r5, r6]
	adds r3, r3, r1
	lsls r3, r3, #1
	ldr r1, _08021C84 @ =0x02022C60
	adds r3, r3, r1
	adds r1, r4, #0
	bl DrawItemMenuLine
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08021C80: .4byte 0x03004690
_08021C84: .4byte 0x02022C60

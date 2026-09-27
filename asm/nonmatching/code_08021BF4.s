	.include "macro.inc"

	.syntax unified

	thumb_func_start WeaponSelectMenu_Selected
WeaponSelectMenu_Selected: @ 0x08021BF4
	push {r4, lr}
	ldr r4, _08021C2C @ =0x03004690
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r1, _08021C30 @ =0x0203A85C
	movs r0, #0
	strb r0, [r1, #0x12]
	bl ClearUi
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl ListAttackTargetsForWeapon
	ldr r0, _08021C34 @ =0x08B95C98
	bl StartMapSelect
	bl sub_080790BC
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08021C2C: .4byte 0x03004690
_08021C30: .4byte 0x0203A85C
_08021C34: .4byte 0x08B95C98

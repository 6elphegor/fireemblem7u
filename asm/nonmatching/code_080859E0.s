	.include "macro.inc"

	.syntax unified

	thumb_func_start BurstDisplay_Loop_Display
BurstDisplay_Loop_Display: @ 0x080859E0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x4b
	ldrb r0, [r5]
	adds r3, r4, #0
	adds r3, #0x4a
	strb r0, [r3]
	ldr r2, _08085A24 @ =0x0202BBB8
	movs r1, #0x16
	ldrsh r0, [r2, r1]
	ldr r1, _08085A28 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r6, #0x14
	ldrsh r1, [r2, r6]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r5]
	ldrb r1, [r3]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r1, r0
	beq _08085A2C
	cmp r1, #0
	beq _08085A2C
	adds r0, r4, #0
	bl ClearUnitBurstMapUi
	movs r0, #0
	str r0, [r4, #0x58]
	b _08085AD4
	.align 2, 0
_08085A24: .4byte 0x0202BBB8
_08085A28: .4byte 0x0202E3DC
_08085A2C:
	adds r0, r4, #0
	adds r0, #0x4b
	ldrb r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	beq _08085AD4
	ldr r0, _08085A7C @ =0x08B92E38
	bl Proc_Find
	cmp r0, #0
	bne _08085AD4
	ldr r0, _08085A80 @ =0x08CC2C00
	bl Proc_Find
	adds r5, r0, #0
	cmp r5, #0
	beq _08085A5A
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08085A70
_08085A5A:
	ldr r0, _08085A84 @ =0x08CC2D38
	bl Proc_Find
	cmp r0, #0
	beq _08085A88
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08085A88
_08085A70:
	ldr r0, [r4, #0x58]
	cmp r0, #3
	bgt _08085AD4
	adds r0, #1
	str r0, [r4, #0x58]
	b _08085AD4
	.align 2, 0
_08085A7C: .4byte 0x08B92E38
_08085A80: .4byte 0x08CC2C00
_08085A84: .4byte 0x08CC2D38
_08085A88:
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #7
	ble _08085AD4
	cmp r0, #8
	bne _08085AA6
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl DrawUnitBurstMapUi
	b _08085AD4
_08085AA6:
	adds r1, r4, #0
	adds r1, #0x44
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	cmp r5, #0
	beq _08085ABE
	adds r0, r5, #0
	adds r0, #0x55
	ldrb r0, [r0]
	adds r1, #0x11
	b _08085AC4
_08085ABE:
	adds r1, r4, #0
	adds r1, #0x55
	movs r0, #0
_08085AC4:
	strb r0, [r1]
	ldrb r0, [r6]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl UnitMapUiUpdate
_08085AD4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

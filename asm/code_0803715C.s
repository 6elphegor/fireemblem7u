	.include "macro.inc"

	.syntax unified

	thumb_func_start SetupUnitInventoryAIFlags
SetupUnitInventoryAIFlags: @ 0x0803715C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08037210 @ =0x0203A8EC
	adds r0, #0x85
	movs r1, #0
	strb r1, [r0]
	movs r4, #1
_08037168:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	cmp r5, #0
	beq _08037202
	ldr r0, [r5]
	cmp r0, #0
	beq _08037202
	ldr r0, [r5, #0xc]
	ldr r1, _08037214 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _08037202
	ldr r0, [r5, #4]
	ldrb r1, [r5, #0x1d]
	ldrb r0, [r0, #0x12]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	ldr r0, _08037210 @ =0x0203A8EC
	adds r0, #0x85
	ldrb r2, [r0]
	cmp r1, r2
	bls _0803719E
	strb r1, [r0]
_0803719E:
	movs r6, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _080371FC
_080371A6:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080371C2
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080371E8
_080371C2:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #2
	ands r1, r0
	cmp r1, #0
	beq _080371D8
	movs r0, #1
	ldrb r1, [r5, #0xa]
	orrs r0, r1
	strb r0, [r5, #0xa]
_080371D8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08037218
	adds r0, r5, #0
	adds r1, r4, #0
	bl SetupUnitHealStaffAIFlags
_080371E8:
	adds r6, #1
	cmp r6, #4
	bgt _080371FC
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080371A6
_080371FC:
	adds r0, r5, #0
	bl SaveNumberOfAlliedUnitsIn0To8Range
_08037202:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _08037168
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08037210: .4byte 0x0203A8EC
_08037214: .4byte 0x00010005

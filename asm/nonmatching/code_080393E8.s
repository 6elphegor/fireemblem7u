	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFillDangerMap
AiFillDangerMap: @ 0x080393E8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov r8, r0
	mov sb, r0
	movs r4, #1
_080393FA:
	adds r0, r4, #0
	bl GetUnit
	adds r6, r0, #0
	adds r4, #1
	mov sl, r4
	cmp r6, #0
	beq _080394E4
	ldr r0, [r6]
	cmp r0, #0
	beq _080394E4
	ldr r0, [r6, #0xc]
	ldr r1, _080394F8 @ =0x0001000D
	ands r0, r1
	cmp r0, #0
	bne _080394E4
	ldr r0, _080394FC @ =0x0202BD48
	ldrb r0, [r0]
	movs r1, #0xb
	ldrsb r1, [r6, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080394E4
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0803946E
_08039434:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803945A
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, sb
	ble _0803945A
	mov r8, r4
	mov r0, r8
	bl GetItemMight
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
_0803945A:
	adds r5, #1
	cmp r5, #4
	bgt _0803946E
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08039434
_0803946E:
	mov r1, r8
	cmp r1, #0
	beq _080394E4
	ldr r0, _08039500 @ =0x03004690
	ldr r0, [r0]
	adds r1, r6, #0
	mov r2, r8
	bl AiCouldReachByBirdsEyeDistance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080394E4
	adds r0, r6, #0
	mov r1, r8
	bl AiMakeMoveRangeMapsForUnitAndWeapon
	ldr r0, _08039504 @ =0x0202E3D8
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r1, r0, #1
	cmp r1, #0
	blt _080394E4
_0803949A:
	ldr r0, _08039504 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r7, r1, #1
	cmp r4, #0
	blt _080394DE
	lsls r5, r1, #2
_080394AA:
	ldr r0, _08039508 @ =0x0202E3E8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080394D8
	adds r0, r6, #0
	bl GetUnitPower
	ldr r1, _0803950C @ =0x0202E3F4
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r4
	add r0, sb
	asrs r0, r0, #1
	ldrb r2, [r1]
	adds r0, r2, r0
	strb r0, [r1]
_080394D8:
	subs r4, #1
	cmp r4, #0
	bge _080394AA
_080394DE:
	adds r1, r7, #0
	cmp r1, #0
	bge _0803949A
_080394E4:
	mov r4, sl
	cmp r4, #0xbf
	ble _080393FA
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080394F8: .4byte 0x0001000D
_080394FC: .4byte 0x0202BD48
_08039500: .4byte 0x03004690
_08039504: .4byte 0x0202E3D8
_08039508: .4byte 0x0202E3E8
_0803950C: .4byte 0x0202E3F4

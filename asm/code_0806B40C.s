	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEkrPopup
NewEkrPopup: @ 0x0806B40C
	push {r4, r5, lr}
	ldr r0, _0806B468 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _0806B480
	ldr r4, _0806B46C @ =0x02020138
	ldr r0, _0806B470 @ =0x08BDCDBC
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _0806B474 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	subs r0, #1
	str r0, [r5, #0x44]
	movs r1, #0
	ldr r3, _0806B478 @ =0x0203E098
	ldr r2, _0806B47C @ =0x0203E094
_0806B434:
	ldr r0, [r3]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806B44E
	ldr r0, [r2]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806B44E
	str r1, [r5, #0x44]
_0806B44E:
	adds r1, #1
	cmp r1, #7
	ble _0806B434
	ldr r1, [r5, #0x44]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0806B51E
	movs r0, #0x80
	bl SetBgmVolume
	b _0806B54A
	.align 2, 0
_0806B468: .4byte 0x0203E02C
_0806B46C: .4byte 0x02020138
_0806B470: .4byte 0x08BDCDBC
_0806B474: .4byte 0x0202013C
_0806B478: .4byte 0x0203E098
_0806B47C: .4byte 0x0203E094
_0806B480:
	ldr r4, _0806B52C @ =0x02020138
	ldr r0, _0806B530 @ =0x08BDCD54
	movs r1, #3
	bl Proc_Start
	adds r5, r0, #0
	str r5, [r4]
	ldr r1, _0806B534 @ =0x0202013C
	movs r0, #0
	str r0, [r1]
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x48]
	str r0, [r5, #0x44]
	str r0, [r5, #0x50]
	str r0, [r5, #0x4c]
	ldr r0, _0806B538 @ =0x0203E020
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806B4D6
	ldr r4, _0806B53C @ =0x0203E094
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B4C0
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x44]
_0806B4C0:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B4D6
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x48]
_0806B4D6:
	ldr r0, _0806B538 @ =0x0203E020
	movs r1, #2
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0806B50E
	ldr r4, _0806B540 @ =0x0203E098
	ldr r0, [r4]
	bl HasBattleUnitGainedWeaponLevel
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B4F8
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x4c]
_0806B4F8:
	ldr r0, [r4]
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0806B50E
	ldr r0, [r4]
	adds r0, #0x4a
	ldrh r0, [r0]
	str r0, [r5, #0x50]
_0806B50E:
	ldr r0, [r5, #0x44]
	ldr r1, [r5, #0x48]
	adds r0, r0, r1
	ldr r1, [r5, #0x4c]
	adds r0, r0, r1
	ldr r1, [r5, #0x50]
	cmn r0, r1
	bne _0806B544
_0806B51E:
	ldr r1, _0806B534 @ =0x0202013C
	movs r0, #1
	str r0, [r1]
	bl EndEkrPopup
	b _0806B54A
	.align 2, 0
_0806B52C: .4byte 0x02020138
_0806B530: .4byte 0x08BDCD54
_0806B534: .4byte 0x0202013C
_0806B538: .4byte 0x0203E020
_0806B53C: .4byte 0x0203E094
_0806B540: .4byte 0x0203E098
_0806B544:
	movs r0, #0x80
	bl SetBgmVolume
_0806B54A:
	pop {r4, r5}
	pop {r0}
	bx r0

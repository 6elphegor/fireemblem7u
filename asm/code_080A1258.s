	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadSuspendSave
ReadSuspendSave: @ 0x080A1258
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r1, _080A1344 @ =0x0203ECC4
	ldrb r1, [r1]
	adds r0, r1, r0
	bl GetSaveReadAddr
	adds r6, r0, #0
	ldr r5, _080A1348 @ =0x03005E70
	ldr r4, _080A134C @ =0x0202BBF8
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	ldr r0, [r4]
	bl SetGameTime
	adds r0, r6, #0
	adds r0, #0x48
	ldr r1, _080A1350 @ =0x0203A85C
	ldr r3, [r5]
	movs r2, #0x1c
	bl _call_via_r3
	bl sub_0802F208
	bl InitUnits
	movs r4, #0
	movs r5, #0
_080A1296:
	movs r0, #0x34
	muls r0, r4, r0
	adds r0, #0x64
	adds r0, r6, r0
	ldr r1, _080A1354 @ =0x0202BD50
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x33
	ble _080A1296
	movs r4, #0
	movs r5, #0
_080A12B2:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r1, _080A1358 @ =0x00000AF4
	adds r0, r0, r1
	adds r0, r6, r0
	ldr r1, _080A135C @ =0x0202CEC0
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #0x31
	ble _080A12B2
	movs r4, #0
	movs r5, #0
_080A12D0:
	movs r0, #0x34
	muls r0, r4, r0
	ldr r2, _080A1360 @ =0x0000151C
	adds r0, r0, r2
	adds r0, r6, r0
	ldr r1, _080A1364 @ =0x0202DCD0
	adds r1, r5, r1
	bl ReadSuspendSavePackedUnit
	adds r5, #0x48
	adds r4, #1
	cmp r4, #9
	ble _080A12D0
	ldr r1, _080A1368 @ =0x000019EC
	adds r0, r6, r1
	bl ReadPidStats
	ldr r2, _080A136C @ =0x00001E4C
	adds r0, r6, r2
	bl ReadChapterStats
	ldr r1, _080A1370 @ =0x00001924
	adds r0, r6, r1
	bl ReadSupplyItems
	ldr r2, _080A1374 @ =0x00001F1C
	adds r0, r6, r2
	bl ReadPermanentFlags
	ldr r1, _080A1378 @ =0x00001F24
	adds r0, r6, r1
	bl ReadChapterFlags
	ldr r2, _080A137C @ =0x00001724
	adds r0, r6, r2
	bl ReadTraps
	ldr r1, _080A1348 @ =0x03005E70
	ldr r2, _080A1380 @ =0x00001F0C
	adds r0, r6, r2
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x10
	bl _call_via_r3
	mov r0, sp
	bl SetForceDisabledMenuItems
	ldr r0, _080A134C @ =0x0202BBF8
	ldrb r0, [r0, #0xc]
	bl LoadSavedBonusClaimFlags
	bl SetBonusContentClaimFlags
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A1344: .4byte 0x0203ECC4
_080A1348: .4byte 0x03005E70
_080A134C: .4byte 0x0202BBF8
_080A1350: .4byte 0x0203A85C
_080A1354: .4byte 0x0202BD50
_080A1358: .4byte 0x00000AF4
_080A135C: .4byte 0x0202CEC0
_080A1360: .4byte 0x0000151C
_080A1364: .4byte 0x0202DCD0
_080A1368: .4byte 0x000019EC
_080A136C: .4byte 0x00001E4C
_080A1370: .4byte 0x00001924
_080A1374: .4byte 0x00001F1C
_080A1378: .4byte 0x00001F24
_080A137C: .4byte 0x00001724
_080A1380: .4byte 0x00001F0C

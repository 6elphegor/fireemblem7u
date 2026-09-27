	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A602C
sub_080A602C: @ 0x080A602C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #0
	adds r0, #0x31
	strb r5, [r0]
	subs r0, #1
	strb r5, [r0]
	adds r6, r4, #0
	adds r6, #0x32
	strb r5, [r6]
	adds r0, #3
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	bne _080A605A
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6004
_080A605A:
	movs r1, #0
	adds r2, r4, #0
	adds r2, #0x37
_080A6060:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080A606A
	adds r5, #1
_080A606A:
	adds r1, #1
	cmp r1, #2
	ble _080A6060
	cmp r5, #0
	ble _080A6090
	adds r0, r4, #0
	movs r1, #2
	bl sub_080A6004
	cmp r5, #2
	bgt _080A6088
	adds r0, r4, #0
	movs r1, #4
	bl sub_080A6004
_080A6088:
	adds r0, r4, #0
	movs r1, #8
	bl sub_080A6004
_080A6090:
	cmp r5, #2
	bgt _080A609C
	adds r0, r4, #0
	movs r1, #0x10
	bl sub_080A6004
_080A609C:
	bl IsExtraLinkArenaEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60AE
	adds r0, r4, #0
	movs r1, #1
	bl sub_080A6018
_080A60AE:
	bl sub_0809EAB8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60C0
	adds r0, r4, #0
	movs r1, #2
	bl sub_080A6018
_080A60C0:
	bl IsExtraSupportViewerEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60D2
	adds r0, r4, #0
	movs r1, #4
	bl sub_080A6018
_080A60D2:
	bl GetRankDataValidBitMap
	cmp r0, #0
	beq _080A60E2
	adds r0, r4, #0
	movs r1, #8
	bl sub_080A6018
_080A60E2:
	bl sub_0809EB78
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A60F4
	adds r0, r4, #0
	movs r1, #0x20
	bl sub_080A6018
_080A60F4:
	ldrb r0, [r6]
	cmp r0, #0
	beq _080A610E
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r1, #1
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A610E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

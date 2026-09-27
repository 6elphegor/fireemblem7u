	.include "macro.inc"

	.syntax unified

	thumb_func_start EventLoadUnitsAsParty
EventLoadUnitsAsParty: @ 0x0800D134
	push {r4, r5, r6, lr}
	ldr r6, [r0, #0x44]
	movs r5, #0
	movs r4, #1
_0800D13C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0800D15A
	ldr r0, [r1]
	cmp r0, #0
	beq _0800D15A
	ldr r0, [r1, #0xc]
	ldr r1, _0800D1B4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D15A
	adds r5, #1
_0800D15A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D13C
	cmp r5, #0
	ble _0800D176
	ldr r0, _0800D1B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _0800D252
_0800D176:
	ldr r0, _0800D1B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0800D1BC
	movs r4, #1
_0800D18A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D1AC
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D1AC
	ldr r1, [r2, #0xc]
	ldr r0, _0800D1B4 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D1AC
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D1AC:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D18A
	b _0800D1EA
	.align 2, 0
_0800D1B4: .4byte 0x00010004
_0800D1B8: .4byte 0x0202BBF8
_0800D1BC:
	movs r4, #1
_0800D1BE:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D1E4
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D1E4
	ldr r1, [r2, #0xc]
	ldr r0, _0800D1F0 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0800D1E4
	movs r0, #1
	orrs r1, r0
	subs r0, #0xa
	ands r1, r0
	str r1, [r2, #0xc]
_0800D1E4:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D1BE
_0800D1EA:
	movs r4, #0
	b _0800D206
	.align 2, 0
_0800D1F0: .4byte 0x00010004
_0800D1F4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	adds r4, #1
	adds r0, r6, #0
	bl FakeLoadUnit
	adds r6, #0x10
_0800D206:
	ldrb r0, [r6]
	cmp r0, #0
	beq _0800D218
	adds r0, r4, #0
	bl GetNextAvailableBlueUnitId
	adds r4, r0, #0
	cmp r4, #0
	bne _0800D1F4
_0800D218:
	movs r4, #1
_0800D21A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800D244
	ldr r0, [r2]
	cmp r0, #0
	beq _0800D244
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800D244
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D244
	movs r0, #8
	orrs r1, r0
	str r1, [r2, #0xc]
_0800D244:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800D21A
	bl RefreshEntityMaps
	bl RefreshUnitSprites
_0800D252:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

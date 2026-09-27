	.include "macro.inc"

	.syntax unified

	thumb_func_start CleanupUnitsBeforeChapter
CleanupUnitsBeforeChapter: @ 0x0802E3D4
	push {r4, r5, r6, r7, lr}
	movs r4, #0x41
_0802E3D8:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0802E3F0
	ldr r0, [r1]
	cmp r0, #0
	beq _0802E3F0
	adds r0, r1, #0
	bl ClearUnit
_0802E3F0:
	adds r4, #1
	cmp r4, #0xbf
	ble _0802E3D8
	ldr r0, _0802E46C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x2f
	beq _0802E474
	movs r6, #1
_0802E400:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E464
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E464
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	movs r5, #0
	strb r5, [r0]
	ldr r3, [r4, #0xc]
	ldr r0, _0802E470 @ =0x0631E004
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E454
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_0802E454:
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	strb r5, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
_0802E464:
	adds r6, #1
	cmp r6, #0x3f
	ble _0802E400
	b _0802E4E6
	.align 2, 0
_0802E46C: .4byte 0x0202BBF8
_0802E470: .4byte 0x0631E004
_0802E474:
	movs r6, #1
_0802E476:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0802E4E0
	ldr r0, [r4]
	cmp r0, #0
	beq _0802E4E0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r5, #0
	movs r7, #1
	strb r7, [r4, #0x11]
	adds r0, r4, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHp
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r5, [r0]
	ldr r3, [r4, #0xc]
	ldr r0, _0802E4F8 @ =0x0631E00C
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _0802E4D2
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_0802E4D2:
	ldr r0, [r4, #0xc]
	orrs r0, r7
	str r0, [r4, #0xc]
	strb r5, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r5, [r0]
_0802E4E0:
	adds r6, #1
	cmp r6, #0x3f
	ble _0802E476
_0802E4E6:
	ldr r1, _0802E4FC @ =0x0202BBF8
	movs r0, #0xef
	ldrb r2, [r1, #0x14]
	ands r0, r2
	strb r0, [r1, #0x14]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802E4F8: .4byte 0x0631E00C
_0802E4FC: .4byte 0x0202BBF8

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809B1C4
sub_0809B1C4: @ 0x0809B1C4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _0809B344 @ =0x08CC5798
	ldr r1, [r7]
	ldr r2, _0809B348 @ =0x01000600
	mov r0, sp
	bl CpuSet
	ldr r5, _0809B34C @ =0x02012BF8
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0809B1F6
	b _0809B35C
_0809B1F6:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _0809B350 @ =0x01000010
	bl CpuSet
	movs r4, #1
_0809B204:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _0809B234
	ldr r2, [r0]
	cmp r2, #0
	beq _0809B234
	ldr r0, [r0, #0xc]
	ldr r1, _0809B354 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809B234
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_0809B234:
	adds r4, #1
	cmp r4, #0x3f
	ble _0809B204
	movs r4, #1
	ldr r0, _0809B34C @ =0x02012BF8
	mov sb, r0
_0809B240:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _0809B33A
	ldr r2, [r5]
	cmp r2, #0
	beq _0809B33A
	ldr r0, [r5, #0xc]
	ldr r1, _0809B354 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809B33A
	ldrb r0, [r2, #4]
	bl GetSupportScreenPartnerCount
	cmp r0, #0
	beq _0809B33A
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0809B344 @ =0x08CC5798
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sb
	ldr r1, [r0]
	ldr r0, _0809B344 @ =0x08CC5798
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _0809B358 @ =0x08BDCE78
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _0809B332
	ldr r7, _0809B34C @ =0x02012BF8
	ldr r0, _0809B344 @ =0x08CC5798
	mov r8, r0
	mov sl, r1
_0809B2B6:
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetSupportScreenPartnerCharId
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl GetSupportClassForCharId
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	adds r1, r1, r6
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r1, [r0, #4]
	subs r1, #1
	movs r0, #0x34
	muls r0, r1, r0
	add r0, sl
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _0809B2B6
_0809B332:
	mov r1, sb
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_0809B33A:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _0809B342
	b _0809B240
_0809B342:
	b _0809B430
	.align 2, 0
_0809B344: .4byte 0x08CC5798
_0809B348: .4byte 0x01000600
_0809B34C: .4byte 0x02012BF8
_0809B350: .4byte 0x01000010
_0809B354: .4byte 0x00010004
_0809B358: .4byte 0x08BDCE78
_0809B35C:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl ReadGlobalSaveInfo
	ldr r0, _0809B3D4 @ =0x0000055B
	bl DecodeMsg
	bl SetTacticianName
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _0809B3D8 @ =0x08BDCE4C
	mov sb, r1
_0809B378:
	adds r0, r6, #0
	mov r1, sl
	bl GGM_IsCharacterKnown
	lsls r0, r0, #0x18
	adds r1, r6, #1
	mov r8, r1
	cmp r0, #0
	beq _0809B42A
	adds r0, r6, #0
	bl GetSupportScreenPartnerCount
	cmp r0, #0
	beq _0809B42A
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, sb
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl GetGlobalSupportListFromSave
	movs r4, #0
	b _0809B41A
	.align 2, 0
_0809B3D4: .4byte 0x0000055B
_0809B3D8: .4byte 0x08BDCE4C
_0809B3DC:
	ldr r0, [r5]
	adds r1, r4, #0
	bl GetSupportScreenPartnerCharId
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	adds r2, r2, r4
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, sb
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl GGM_IsCharacterKnown
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	adds r1, r1, r4
	strb r0, [r1]
	adds r4, #1
_0809B41A:
	adds r0, r6, #0
	bl GetSupportScreenPartnerCount
	cmp r4, r0
	blt _0809B3DC
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_0809B42A:
	mov r6, r8
	cmp r6, #0xff
	ble _0809B378
_0809B430:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	.include "macro.inc"

	.syntax unified

	thumb_func_start GetActiveMapSong
GetActiveMapSong: @ 0x08015E9C
	push {r4, r5, r6, r7, lr}
	ldr r0, _08015ED0 @ =0x0202BBF8
	movs r1, #0
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _08015EAA
	movs r1, #3
_08015EAA:
	adds r4, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #6
	cmp r0, #0
	bne _08015EBC
	adds r1, r4, #0
_08015EBC:
	adds r7, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015ED4
	adds r1, r4, #1
	b _08015ED6
	.align 2, 0
_08015ED0: .4byte 0x0202BBF8
_08015ED4:
	movs r1, #7
_08015ED6:
	adds r6, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08015EE8
	adds r4, #2
	b _08015EEA
_08015EE8:
	movs r4, #6
_08015EEA:
	ldr r5, _08015EFC @ =0x0202BBF8
	ldrb r0, [r5, #0xf]
	cmp r0, #0x40
	beq _08015F16
	cmp r0, #0x40
	bgt _08015F00
	cmp r0, #0
	beq _08015F28
	b _08015F78
	.align 2, 0
_08015EFC: .4byte 0x0202BBF8
_08015F00:
	cmp r0, #0x80
	bne _08015F78
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r6, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _08015F78
_08015F16:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	lsls r1, r4, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _08015F78
_08015F28:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08015F64
	ldr r1, _08015F60 @ =0x0001000C
	movs r0, #0x80
	bl CountFactionUnitsWithoutFlags
	adds r4, r0, #0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	bgt _08015F64
	movs r0, #9
	b _08015F78
	.align 2, 0
_08015F60: .4byte 0x0001000C
_08015F64:
	ldr r0, _08015F80 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
_08015F78:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08015F80: .4byte 0x0202BBF8

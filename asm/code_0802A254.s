	.include "macro.inc"

	.syntax unified

	thumb_func_start InitObstacleBattleUnit
InitObstacleBattleUnit: @ 0x0802A254
	push {r4, lr}
	ldr r4, _0802A2AC @ =0x0203A470
	adds r0, r4, #0
	bl ClearUnit
	movs r0, #0
	strb r0, [r4, #0xb]
	movs r0, #1
	bl GetClassData
	str r0, [r4, #4]
	ldr r0, _0802A2B0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r4, #0x12]
	ldr r1, _0802A2B4 @ =0x0203A85C
	ldrb r0, [r1, #0x15]
	strb r0, [r4, #0x13]
	ldrb r0, [r1, #0x13]
	strb r0, [r4, #0x10]
	ldrb r0, [r1, #0x14]
	strb r0, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802A2B8 @ =0x0202E3E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x1b
	beq _0802A2BC
	cmp r0, #0x33
	beq _0802A2C6
	b _0802A2D2
	.align 2, 0
_0802A2AC: .4byte 0x0203A470
_0802A2B0: .4byte 0x0202BBF8
_0802A2B4: .4byte 0x0203A85C
_0802A2B8: .4byte 0x0202E3E0
_0802A2BC:
	movs r0, #0xfc
	bl GetCharacterData
	str r0, [r4]
	b _0802A2D2
_0802A2C6:
	movs r0, #0xfd
	bl GetCharacterData
	str r0, [r4]
	movs r0, #0x14
	strb r0, [r4, #0x12]
_0802A2D2:
	pop {r4}
	pop {r0}
	bx r0

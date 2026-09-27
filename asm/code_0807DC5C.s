	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DC5C
sub_0807DC5C: @ 0x0807DC5C
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x60
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807DC7A
	bl EndTalk
	movs r0, #0
	b _0807DD8E
_0807DC7A:
	bl IsTalkActive
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807DC88
	b _0807DD8C
_0807DC88:
	ldrb r0, [r5]
	cmp r0, #1
	beq _0807DCF0
	cmp r0, #1
	bgt _0807DC98
	cmp r0, #0
	beq _0807DCA2
	b _0807DD8C
_0807DC98:
	cmp r0, #2
	beq _0807DD18
	cmp r0, #3
	beq _0807DD56
	b _0807DD8C
_0807DCA2:
	movs r6, #1
	ldrb r0, [r5, #1]
	cmp r0, #0
	beq _0807DCE4
	adds r6, r0, #0
	b _0807DCE4
_0807DCAE:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DCE2
	ldr r2, [r4]
	cmp r2, #0
	beq _0807DCE2
	ldr r0, [r4, #0xc]
	ldr r1, _0807DCEC @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _0807DCE2
	ldrb r0, [r2, #4]
	strb r0, [r5, #2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	beq _0807DCE2
	cmp r0, #2
	beq _0807DCE2
	cmp r0, #0x2d
	beq _0807DCE2
	cmp r0, #0x26
	bne _0807DD48
_0807DCE2:
	adds r6, #1
_0807DCE4:
	cmp r6, #0x3f
	ble _0807DCAE
	movs r0, #0
	b _0807DD8E
	.align 2, 0
_0807DCEC: .4byte 0x0001000C
_0807DCF0:
	ldrb r0, [r5, #2]
	bl GetUnitFromCharId
	adds r4, r0, #0
	cmp r4, #0
	beq _0807DD38
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x11
	ldrsb r2, [r4, r2]
	adds r0, r6, #0
	bl EnsureCameraOntoPosition
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl SetMapCursorPosition
	b _0807DD38
_0807DD18:
	ldr r4, _0807DD40 @ =0x08B907C0
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0807DD38
	bl ClearTalkBubble
	ldr r1, _0807DD44 @ =StartFaceFadeOut
	adds r0, r4, #0
	bl Proc_ForEach
	adds r0, r6, #0
	movs r1, #8
	bl StartTemporaryLock
_0807DD38:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _0807DD8C
	.align 2, 0
_0807DD40: .4byte 0x08B907C0
_0807DD44: .4byte StartFaceFadeOut
_0807DD48:
	ldrb r0, [r5, #2]
	bl sub_0807DC30
	strh r0, [r5, #4]
	adds r0, r6, #1
	strb r0, [r5, #1]
	b _0807DD38
_0807DD56:
	ldrh r0, [r5, #4]
	cmp r0, #0
	beq _0807DD8A
	bl SetInitTalkTextFont
	bl ClearTalkText
	bl ClearPutTalkText
	bl ClearTalk
	ldrh r0, [r5, #4]
	bl DecodeMsg
	adds r2, r0, #0
	movs r0, #0xa
	movs r1, #0xe
	movs r3, #0
	bl StartTalkExt
	movs r0, #1
	bl SetTalkPrintColor
	movs r0, #1
	bl SetActiveTalkFace
_0807DD8A:
	strb r4, [r5]
_0807DD8C:
	movs r0, #1
_0807DD8E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

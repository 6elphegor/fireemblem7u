	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08008E34
sub_08008E34: @ 0x08008E34
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08008E5C @ =0x08B909B8
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne _08008E4A
	movs r0, #1
	bl SetActiveTalkFace
_08008E4A:
	bl IsBattleDeamonActive
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08008E60
	bl sub_0800ED68
	b _08008E62
	.align 2, 0
_08008E5C: .4byte 0x08B909B8
_08008E60:
	movs r6, #2
_08008E62:
	ldr r4, _08008E94 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl GetTalkFaceHPos
	cmp r0, #0xe
	bgt _08008E74
	movs r0, #1
	orrs r6, r0
_08008E74:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r1, [r0, #1]
	lsls r4, r1, #8
	ldrb r0, [r0]
	orrs r4, r0
	ldr r0, _08008E98 @ =0x0000FFFF
	cmp r4, r0
	bne _08008EA0
	ldr r0, _08008E9C @ =0x03004690
	ldr r0, [r0]
	bl GetUnitPortraitId
	adds r4, r0, #0
	b _08008EA4
	.align 2, 0
_08008E94: .4byte 0x08B909B8
_08008E98: .4byte 0x0000FFFF
_08008E9C: .4byte 0x03004690
_08008EA0:
	ldr r2, _08008EC0 @ =0xFFFFFF00
	adds r4, r4, r2
_08008EA4:
	ldr r5, _08008EC4 @ =0x08B909B8
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _08008EC8
	adds r1, r4, #0
	bl sub_08007DB8
	b _08008F10
	.align 2, 0
_08008EC0: .4byte 0xFFFFFF00
_08008EC4: .4byte 0x08B909B8
_08008EC8:
	adds r0, r2, #0
	bl GetTalkFaceHPos
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl StartFaceAuto
	ldr r3, [r5]
	ldrb r2, [r3, #0x11]
	lsls r1, r2, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r3, [r3, #0x11]
	lsls r0, r3, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl StartFaceFadeIn
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckTalkFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008F6C
	adds r0, r7, #0
	movs r1, #8
	bl StartTemporaryLock
_08008F10:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

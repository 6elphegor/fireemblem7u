	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800838C
sub_0800838C: @ 0x0800838C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl sub_08009EE0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080083F8
	ldr r4, _080083F4 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _080083F8
	movs r0, #2
	bl CheckTalkFlag
	cmp r0, #0
	bne _080083F8
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _080083B8
	ldr r0, [r1]
_080083B8:
	movs r1, #0
	bl GetStrTalkLen
	adds r0, #7
	movs r1, #8
	bl Div
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl ClearTalkBubble
	ldr r4, _080083F4 @ =0x08B909B8
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl StartTalkOpen
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckTalkFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_08008F6C
	movs r0, #1
	b _08008468
	.align 2, 0
_080083F4: .4byte 0x08B909B8
_080083F8:
	ldr r6, _08008414 @ =0x08B909B8
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	blo _0800841C
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _08008418 @ =0x08B90B24
	adds r1, r7, #0
	bl Proc_StartBlocking
	movs r0, #1
	b _08008468
	.align 2, 0
_08008414: .4byte 0x08B909B8
_08008418: .4byte 0x08B90B24
_0800841C:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _08008458
	ldrb r4, [r5, #9]
	ldrb r1, [r5, #0xb]
	adds r0, r1, r4
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08008470 @ =0x030000C8
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r1, r4
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r5, r4
	lsls r4, r4, #1
	ldr r1, _08008474 @ =0x02022C60
	adds r4, r4, r1
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl TalkBgSync
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_08008458:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _08008466
	ldrb r0, [r1, #0x11]
	bl SetTalkFaceMouthMove
_08008466:
	movs r0, #0
_08008468:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08008470: .4byte 0x030000C8
_08008474: .4byte 0x02022C60

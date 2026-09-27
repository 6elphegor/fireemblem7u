	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08093734
sub_08093734: @ 0x08093734
	push {r4, r5, r6, lr}
	sub sp, #8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	bne _08093780
	ldr r0, _08093788 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	adds r0, #0x8e
	ldrh r0, [r0]
	bl DecodeMsg
	adds r4, r0, #0
	ldr r5, _0809378C @ =0x02012B40
	adds r0, r5, #0
	bl ClearText
	movs r0, #0x50
	adds r1, r4, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	ldr r1, _08093790 @ =0x02023062
	str r6, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r2, #0
	bl PutDrawText
	movs r0, #1
	bl EnableBgSync
_08093780:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08093788: .4byte 0x0202BBF8
_0809378C: .4byte 0x02012B40
_08093790: .4byte 0x02023062

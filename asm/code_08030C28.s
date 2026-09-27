	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030C28
sub_08030C28: @ 0x08030C28
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08030C94 @ =0x08196228
	movs r1, #0
	bl StartSpriteAnim
	adds r4, r0, #0
	movs r0, #0
	strh r0, [r4, #0x22]
	adds r0, r4, #0
	movs r1, #0
	bl SetSpriteAnimId
	str r4, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x4a
	movs r0, #2
	strh r0, [r1]
	ldr r1, _08030C98 @ =0x0202BBB8
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x3c]
	movs r2, #0x16
	ldrsh r0, [r1, r2]
	str r0, [r5, #0x40]
	ldr r0, _08030C9C @ =0x00000726
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r5, #0
	bl StartSubtitleHelp
	ldr r0, _08030CA0 @ =0x03004690
	ldr r0, [r0]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl EnsureCameraOntoPosition
	ldr r0, _08030CA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08030C8C
	ldr r0, _08030CA8 @ =0x00000389
	bl m4aSongNumStart
_08030C8C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08030C94: .4byte 0x08196228
_08030C98: .4byte 0x0202BBB8
_08030C9C: .4byte 0x00000726
_08030CA0: .4byte 0x03004690
_08030CA4: .4byte 0x0202BBF8
_08030CA8: .4byte 0x00000389

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A71A8
sub_080A71A8: @ 0x080A71A8
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A7220 @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #0x10
	movs r1, #0xb
	movs r2, #0xa
	movs r3, #4
	bl DrawUiFrame2
	movs r0, #2
	bl EnableBgSync
	ldr r0, [r4, #0x2c]
	lsls r0, r0, #5
	adds r0, #0x88
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x60
	movs r2, #3
	bl ShowSysHandCursor
	ldr r0, _080A7224 @ =0x0200006C
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r4, #0
	movs r5, #0
_080A71F2:
	adds r0, r4, #0
	bl sub_080A6DC0
	bl DecodeMsg
	adds r3, r0, #0
	ldr r0, _080A7228 @ =0x0200008C
	adds r1, r5, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #0x1f
	adds r4, #1
	cmp r4, #1
	ble _080A71F2
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A7220: .4byte 0x0202BBF8
_080A7224: .4byte 0x0200006C
_080A7228: .4byte 0x0200008C

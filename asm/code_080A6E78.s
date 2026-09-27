	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6E78
sub_080A6E78: @ 0x080A6E78
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _080A6F2C @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsrs r0, r0, #4
	str r0, [r4, #0x2c]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb
	movs r2, #0x1a
	movs r3, #6
	bl DrawUiFrame2
	movs r0, #2
	bl EnableBgSync
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	movs r1, #6
	bl __modsi3
	adds r4, r0, #0
	lsls r4, r4, #5
	adds r4, #0x1a
	adds r0, r5, #0
	movs r1, #6
	bl __divsi3
	adds r1, r0, #0
	lsls r1, r1, #4
	adds r1, #0x60
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r4, #0
	movs r2, #2
	bl ShowSysHandCursor
	ldr r4, _080A6F30 @ =0x0200006C
	adds r0, r4, #0
	bl SetTextFont
	movs r0, #0
	bl SetTextFontGlyphs
	movs r5, #0
	movs r7, #0
	adds r6, r4, #0
	adds r6, #0x20
_080A6EDE:
	adds r0, r5, #0
	bl sub_080A6DB0
	bl DecodeMsg
	adds r3, r0, #0
	strb r7, [r3, #3]
	lsls r4, r5, #5
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r0, r5, #6
	bl sub_080A6DB0
	bl DecodeMsg
	adds r3, r0, #0
	strb r7, [r3, #3]
	adds r0, r6, #0
	adds r0, #8
	adds r1, r4, #0
	movs r2, #0
	bl Text_InsertDrawString
	adds r5, #1
	cmp r5, #5
	ble _080A6EDE
	movs r0, #0
	bl DecodeMsg
	movs r0, #0
	bl SetTextFont
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6F2C: .4byte 0x0202BBF8
_080A6F30: .4byte 0x0200006C

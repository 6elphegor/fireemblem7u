	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809C044
sub_0809C044: @ 0x0809C044
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r4, _0809C118 @ =0x020129A8
	ldr r0, _0809C11C @ =0x08194714
	movs r1, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	adds r0, r4, #0
	subs r0, #0x18
	bl SetTextFont
	movs r0, #1
	bl SetTextFontGlyphs
	bl GetTacticianName
	adds r1, r4, #0
	adds r4, #8
	ldr r6, _0809C120 @ =0x02023D80
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r1, #0
	adds r1, r6, #0
	movs r2, #4
	movs r3, #0
	bl PutDrawText
	subs r0, r6, #4
	ldr r2, _0809C124 @ =0x081C3AC0
	ldr r5, _0809C128 @ =0x0202BBF8
	adds r7, r5, #0
	adds r7, #0x2b
	ldrb r3, [r7]
	lsrs r1, r3, #4
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x79
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	ldrb r7, [r7]
	lsrs r0, r7, #4
	bl sub_080A6DB0
	bl DecodeMsg
	adds r7, r0, #0
	movs r0, #0x40
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	adds r0, r4, #0
	adds r4, #8
	adds r1, r6, #0
	adds r1, #0xee
	mov r2, r8
	str r2, [sp]
	str r7, [sp, #4]
	movs r2, #4
	bl PutDrawText
	adds r5, #0x2c
	ldrb r5, [r5]
	lsls r0, r5, #0x1f
	lsrs r0, r0, #0x1f
	bl sub_080A6DC0
	bl DecodeMsg
	adds r7, r0, #0
	movs r0, #0x40
	adds r1, r7, #0
	bl GetStringTextCenteredPos
	adds r3, r0, #0
	movs r0, #0x82
	lsls r0, r0, #1
	adds r6, r6, r0
	mov r2, r8
	str r2, [sp]
	str r7, [sp, #4]
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #4
	bl PutDrawText
	movs r0, #0
	bl SetTextFont
	movs r0, #4
	bl EnableBgSync
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C118: .4byte 0x020129A8
_0809C11C: .4byte 0x08194714
_0809C120: .4byte 0x02023D80
_0809C124: .4byte 0x081C3AC0
_0809C128: .4byte 0x0202BBF8

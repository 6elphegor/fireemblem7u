	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcEventWrapAnim_Init
ProcEventWrapAnim_Init: @ 0x08020848
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08020900 @ =0x0819C848
	ldr r1, _08020904 @ =0x06002000
	bl Decompress
	ldr r0, _08020908 @ =0x0819CF90
	movs r1, #0xa0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _0802090C @ =0x0819CFB0
	ldr r4, _08020910 @ =0x0200323C
	adds r1, r4, #0
	bl Decompress
	movs r0, #0xa2
	lsls r0, r0, #7
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08020872:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08020872
	ldr r0, _08020914 @ =0x02022C60
	movs r1, #0x80
	lsls r1, r1, #1
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r0, _08020918 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080208A2
	movs r0, #0xb4
	bl m4aSongNumStart
_080208A2:
	ldr r3, _0802091C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0xa
	strb r0, [r1]
	adds r1, #1
	movs r0, #0xc
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _08020920 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #1
	orrs r0, r1
	ldr r1, _08020924 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r3, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020900: .4byte 0x0819C848
_08020904: .4byte 0x06002000
_08020908: .4byte 0x0819CF90
_0802090C: .4byte 0x0819CFB0
_08020910: .4byte 0x0200323C
_08020914: .4byte 0x02022C60
_08020918: .4byte 0x0202BBF8
_0802091C: .4byte 0x03002870
_08020920: .4byte 0x0000FFE0
_08020924: .4byte 0x0000E0FF

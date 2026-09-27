	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B1E28
sub_080B1E28: @ 0x080B1E28
	push {r7, lr}
	mov r7, sp
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #1
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #2
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #4
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #8
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x10
	orrs r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xdf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0xbf
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	ldr r0, _080B1F04 @ =0x03002870
	ldrb r1, [r0, #1]
	movs r2, #0x7f
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r1, _080B1F08 @ =0x02022C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B1F0C @ =0x02023460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B1F10 @ =0x02023C60
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	ldr r1, _080B1F14 @ =0x02024460
	adds r0, r1, #0
	movs r1, #0
	bl TmFill
	movs r0, #0xf
	bl EnableBgSync
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0
	bl LoadHelpBoxGfx
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1F04: .4byte 0x03002870
_080B1F08: .4byte 0x02022C60
_080B1F0C: .4byte 0x02023460
_080B1F10: .4byte 0x02023C60
_080B1F14: .4byte 0x02024460

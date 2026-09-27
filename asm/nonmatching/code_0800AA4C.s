	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AA4C
sub_0800AA4C: @ 0x0800AA4C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _0800AAB4 @ =0x06002000
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	movs r3, #0
	bl InitTextFont
	bl ClearIcons
	bl UnpackUiWindowFrameGraphics
	ldr r3, _0800AAB8 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
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
	adds r0, r4, #0
	bl ParsePopupInstAndGetLen
	adds r4, #0x46
	strh r0, [r4]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800AAB4: .4byte 0x06002000
_0800AAB8: .4byte 0x03002870

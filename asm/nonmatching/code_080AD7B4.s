	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AD7B4
sub_080AD7B4: @ 0x080AD7B4
	push {r4, lr}
	adds r4, r0, #0
	bl sub_080AD484
	ldr r2, _080AD814 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080AD818 @ =0x02023460
	movs r1, #0
	bl TmFill
	ldr r0, _080AD81C @ =0x02022C60
	movs r1, #0
	bl TmFill
	bl sub_080ACF08
	movs r0, #3
	bl EnableBgSync
	movs r0, #0
	bl DisableUiCursorHand
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r1, r0, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x40
	movs r2, #0xd
	bl ShowSysHandCursor
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AD814: .4byte 0x03002870
_080AD818: .4byte 0x02023460
_080AD81C: .4byte 0x02022C60

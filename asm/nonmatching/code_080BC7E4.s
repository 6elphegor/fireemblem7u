	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC7E4
sub_080BC7E4: @ 0x080BC7E4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
	str r6, [r5, #0x2c]
	ldr r0, _080BC8A4 @ =0x08CEF630
	str r0, [r5, #0x3c]
	bl sub_080BC5E0
	str r0, [r5, #0x34]
	ldr r7, _080BC8A8 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ldrb r1, [r7, #0xc]
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r7, #0xc]
	movs r0, #3
	ldrb r1, [r7, #0x10]
	orrs r1, r0
	strb r1, [r7, #0x10]
	ldrb r1, [r7, #0x14]
	orrs r0, r1
	strb r0, [r7, #0x14]
	ldrb r0, [r7, #0x18]
	ands r2, r0
	movs r0, #1
	orrs r2, r0
	strb r2, [r7, #0x18]
	ldr r0, _080BC8AC @ =0x02022C60
	movs r1, #0
	bl TmFill
	movs r0, #1
	bl EnableBgSync
	ldr r4, _080BC8B0 @ =0x03001620
	ldr r0, [r4]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r4]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r7, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x45
	strb r6, [r0]
	adds r0, #1
	strb r6, [r0]
	ldr r0, _080BC8B4 @ =0x0000FFE0
	ldrh r2, [r7, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _080BC8B8 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	ldr r0, [r5, #0x14]
	movs r1, #0
	bl Proc_Goto
	bl InitOpScanlineBuf
	ldr r1, _080BC8BC @ =0x02007018
	movs r0, #0xc0
	lsls r0, r0, #2
	str r0, [r1, #8]
	str r0, [r1, #4]
	movs r0, #0xc8
	lsls r0, r0, #1
	str r0, [r1, #0xc]
	movs r0, #0xc8
	lsls r0, r0, #2
	str r0, [r1, #0x10]
	ldr r0, [r4]
	movs r1, #4
	orrs r0, r1
	str r0, [r4]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BC8A4: .4byte 0x08CEF630
_080BC8A8: .4byte 0x03002870
_080BC8AC: .4byte 0x02022C60
_080BC8B0: .4byte 0x03001620
_080BC8B4: .4byte 0x0000FFE0
_080BC8B8: .4byte 0x0000E0FF
_080BC8BC: .4byte 0x02007018

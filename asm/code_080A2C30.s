	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A2C30
sub_080A2C30: @ 0x080A2C30
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080A2C94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A2C46
	ldr r0, _080A2C98 @ =0x00000399
	bl m4aSongNumStart
_080A2C46:
	ldr r2, _080A2C9C @ =0x030028AC
	ldr r0, _080A2CA0 @ =0x0000FFE0
	ldrh r1, [r2]
	ands r0, r1
	movs r1, #0xc
	orrs r0, r1
	ldr r1, _080A2CA4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	movs r0, #0xc0
	ldrb r5, [r2]
	orrs r0, r5
	strb r0, [r2]
	movs r3, #0
	movs r0, #0x10
	strb r0, [r2, #8]
	strb r3, [r2, #9]
	movs r0, #4
	strb r0, [r2, #0xa]
	ldr r0, _080A2CA8 @ =0x02000500
	ldr r1, _080A2CAC @ =0x02000280
	str r1, [r0]
	ldr r2, _080A2CB0 @ =0x02000504
	ldr r5, _080A2CB4 @ =0xFFFFFD80
	adds r0, r1, r5
	str r0, [r2]
	ldr r0, _080A2CB8 @ =0x02000508
	str r1, [r0]
	adds r0, r4, #0
	adds r0, #0x4c
	strh r3, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A2C94: .4byte 0x0202BBF8
_080A2C98: .4byte 0x00000399
_080A2C9C: .4byte 0x030028AC
_080A2CA0: .4byte 0x0000FFE0
_080A2CA4: .4byte 0x0000E0FF
_080A2CA8: .4byte 0x02000500
_080A2CAC: .4byte 0x02000280
_080A2CB0: .4byte 0x02000504
_080A2CB4: .4byte 0xFFFFFD80
_080A2CB8: .4byte 0x02000508

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804BC18
sub_0804BC18: @ 0x0804BC18
	adds r2, r0, #0
	ldrh r1, [r2, #0x2c]
	adds r1, #1
	strh r1, [r2, #0x2c]
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	ble _0804BC38
	movs r0, #0
	strh r0, [r2, #0x2c]
	ldr r0, _0804BC34 @ =sub_0804BC64
	str r0, [r2, #0xc]
	b _0804BC5E
	.align 2, 0
_0804BC34: .4byte sub_0804BC64
_0804BC38:
	ldr r3, _0804BC60 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r0, #0
	strb r0, [r2]
	movs r2, #0x6c
	rsbs r2, r2, #0
	adds r0, r2, #0
	subs r0, r0, r1
	adds r2, r3, #0
	adds r2, #0x31
	strb r0, [r2]
	subs r2, #5
	movs r0, #0xf0
	strb r0, [r2]
	subs r1, #0x6c
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
_0804BC5E:
	bx lr
	.align 2, 0
_0804BC60: .4byte 0x03002870

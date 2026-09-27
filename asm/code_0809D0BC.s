	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D0BC
sub_0809D0BC: @ 0x0809D0BC
	push {r4, r5, lr}
	adds r0, #0x3a
	movs r4, #0
	strb r4, [r0]
	bl HideSysHandCursor
	ldr r3, _0809D14C @ =0x03002870
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r3, #0xc]
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0xc]
	movs r0, #3
	ldrb r5, [r3, #0x10]
	orrs r0, r5
	strb r0, [r3, #0x10]
	adds r0, r1, #0
	ldrb r5, [r3, #0x14]
	ands r0, r5
	orrs r0, r2
	strb r0, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	ands r1, r0
	strb r1, [r3, #0x18]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _0809D150 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #8
	orrs r0, r1
	ldr r1, _0809D154 @ =0x0000E0FF
	ands r0, r1
	movs r5, #0xb8
	lsls r5, r5, #5
	adds r1, r5, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	bl sub_0809C49C
	ldr r0, _0809D158 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809D144
	movs r0, #0xc8
	bl m4aSongNumStart
_0809D144:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809D14C: .4byte 0x03002870
_0809D150: .4byte 0x0000FFE0
_0809D154: .4byte 0x0000E0FF
_0809D158: .4byte 0x0202BBF8

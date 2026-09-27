	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807EC30
sub_0807EC30: @ 0x0807EC30
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0807EC98 @ =0x03002870
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
	movs r4, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, _0807EC9C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	ldr r1, _0807ECA0 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xf8
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	movs r0, #1
	bl sub_0807E7D4
	movs r0, #2
	bl sub_0807E7D4
	adds r5, #0x4c
	strh r4, [r5]
	ldr r0, _0807ECA4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807EC90
	movs r0, #0xe5
	bl m4aSongNumStart
_0807EC90:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807EC98: .4byte 0x03002870
_0807EC9C: .4byte 0x0000FFE0
_0807ECA0: .4byte 0x0000E0FF
_0807ECA4: .4byte 0x0202BBF8

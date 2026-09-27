	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807B7B4
sub_0807B7B4: @ 0x0807B7B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x39
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807B7E8
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _0807B7E8
	ldr r0, _0807B814 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B7DC
	movs r0, #0xe5
	bl m4aSongNumStart
_0807B7DC:
	movs r0, #0
	str r0, [r4, #0x50]
	ldr r0, [r4, #0x14]
	movs r1, #0
	bl Proc_Goto
_0807B7E8:
	ldr r0, [r4, #0x54]
	cmp r0, #0
	bne _0807B80A
	ldr r0, [r4, #0x50]
	movs r1, #0x1f
	ands r0, r1
	cmp r0, #0
	bne _0807B80A
	ldr r0, _0807B814 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0807B80A
	movs r0, #0xf8
	bl m4aSongNumStart
_0807B80A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0807B814: .4byte 0x0202BBF8

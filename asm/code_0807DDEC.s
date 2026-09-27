	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DDEC
sub_0807DDEC: @ 0x0807DDEC
	push {lr}
	ldr r0, _0807DE10 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807DE14
	bl sub_0807A1F8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE14
	movs r0, #7
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DE14
	movs r0, #1
	b _0807DE16
	.align 2, 0
_0807DE10: .4byte 0x0202BBF8
_0807DE14:
	movs r0, #0
_0807DE16:
	pop {r1}
	bx r1
	.align 2, 0

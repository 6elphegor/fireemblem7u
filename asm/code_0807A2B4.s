	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A2B4
sub_0807A2B4: @ 0x0807A2B4
	movs r1, #0
	ldr r0, _0807A2C4 @ =0x0202BBF8
	ldrh r0, [r0, #0x10]
	cmp r0, #0x14
	bls _0807A2C0
	movs r1, #1
_0807A2C0:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A2C4: .4byte 0x0202BBF8

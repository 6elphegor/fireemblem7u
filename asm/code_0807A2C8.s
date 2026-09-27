	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A2C8
sub_0807A2C8: @ 0x0807A2C8
	movs r1, #0
	ldr r0, _0807A2D8 @ =0x0202BBF8
	ldrh r0, [r0, #0x10]
	cmp r0, #0x19
	bls _0807A2D4
	movs r1, #1
_0807A2D4:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A2D8: .4byte 0x0202BBF8

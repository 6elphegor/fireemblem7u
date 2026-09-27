	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A2DC
sub_0807A2DC: @ 0x0807A2DC
	movs r1, #0
	ldr r0, _0807A2EC @ =0x0202BBF8
	ldrh r0, [r0, #0x10]
	cmp r0, #0x1e
	bls _0807A2E8
	movs r1, #1
_0807A2E8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A2EC: .4byte 0x0202BBF8

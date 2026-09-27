	.include "macro.inc"

	.syntax unified

	thumb_func_start IsTactFemale
IsTactFemale: @ 0x0807A3C8
	ldr r0, _0807A3D4 @ =0x0202BBF8
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807A3D4: .4byte 0x0202BBF8

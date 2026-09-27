	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A3B8
sub_0807A3B8: @ 0x0807A3B8
	ldr r0, _0807A3C4 @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807A3C4: .4byte 0x0202BBF8

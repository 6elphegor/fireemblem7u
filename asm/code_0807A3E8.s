	.include "macro.inc"

	.syntax unified

	thumb_func_start IsTutorialDisabled
IsTutorialDisabled: @ 0x0807A3E8
	ldr r0, _0807A3F4 @ =0x0202BBF8
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0807A3F4: .4byte 0x0202BBF8

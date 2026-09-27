	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A420
sub_0807A420: @ 0x0807A420
	movs r1, #0
	ldr r0, _0807A430 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807A42C
	movs r1, #1
_0807A42C:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A430: .4byte 0x0202BBF8

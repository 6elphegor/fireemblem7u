	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A304
sub_0807A304: @ 0x0807A304
	movs r1, #0
	ldr r0, _0807A314 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	bne _0807A310
	movs r1, #1
_0807A310:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A314: .4byte 0x0202BBF8

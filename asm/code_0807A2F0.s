	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A2F0
sub_0807A2F0: @ 0x0807A2F0
	movs r1, #0
	ldr r0, _0807A300 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0807A2FC
	movs r1, #1
_0807A2FC:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A300: .4byte 0x0202BBF8

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A49C
sub_0807A49C: @ 0x0807A49C
	movs r1, #0
	ldr r0, _0807A4AC @ =0x0203A85C
	ldrb r0, [r0, #0x11]
	cmp r0, #1
	bne _0807A4A8
	movs r1, #1
_0807A4A8:
	adds r0, r1, #0
	bx lr
	.align 2, 0
_0807A4AC: .4byte 0x0203A85C

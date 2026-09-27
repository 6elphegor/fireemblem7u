	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A47C
sub_0807A47C: @ 0x0807A47C
	ldr r0, _0807A494 @ =0x0202BBF8
	ldrb r1, [r0, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _0807A498
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0807A498
	movs r0, #0
	b _0807A49A
	.align 2, 0
_0807A494: .4byte 0x0202BBF8
_0807A498:
	movs r0, #1
_0807A49A:
	bx lr

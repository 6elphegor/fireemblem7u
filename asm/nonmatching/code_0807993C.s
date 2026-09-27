	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807993C
sub_0807993C: @ 0x0807993C
	ldr r1, _0807994C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08079950
	movs r0, #0
	b _08079952
	.align 2, 0
_0807994C: .4byte 0x0202BBF8
_08079950:
	movs r0, #1
_08079952:
	bx lr

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099340
sub_08099340: @ 0x08099340
	ldr r0, _08099350 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x12
	bgt _08099354
	movs r0, #0
	b _08099356
	.align 2, 0
_08099350: .4byte 0x0202BBF8
_08099354:
	movs r0, #1
_08099356:
	bx lr

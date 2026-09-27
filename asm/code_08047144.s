	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047144
sub_08047144: @ 0x08047144
	ldr r2, _08047154 @ =0x02001180
	ldr r3, [r2]
	ldr r1, _08047158 @ =0x02001184
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_08047154: .4byte 0x02001180
_08047158: .4byte 0x02001184

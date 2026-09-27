	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08025F8C
sub_08025F8C: @ 0x08025F8C
	ldr r1, _08025F94 @ =0x0202BBB8
	ldr r0, _08025F98 @ =0x0000FFFF
	strh r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08025F94: .4byte 0x0202BBB8
_08025F98: .4byte 0x0000FFFF

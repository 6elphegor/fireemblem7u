	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022F6C
sub_08022F6C: @ 0x08022F6C
	ldr r1, _08022F74 @ =0x0203A85C
	movs r0, #0x20
	strb r0, [r1, #0x11]
	bx lr
	.align 2, 0
_08022F74: .4byte 0x0203A85C

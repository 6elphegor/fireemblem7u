	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805076C
sub_0805076C: @ 0x0805076C
	ldr r1, _08050774 @ =0x0201775C
	movs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08050774: .4byte 0x0201775C

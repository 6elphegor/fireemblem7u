	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08026568
sub_08026568: @ 0x08026568
	ldr r1, _08026570 @ =0x02039F1C
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_08026570: .4byte 0x02039F1C

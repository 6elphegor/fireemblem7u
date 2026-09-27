	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08064A2C
sub_08064A2C: @ 0x08064A2C
	ldr r0, _08064A38 @ =0x02020040
	movs r1, #1
	ldrh r2, [r0]
	orrs r1, r2
	strh r1, [r0]
	bx lr
	.align 2, 0
_08064A38: .4byte 0x02020040

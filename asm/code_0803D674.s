	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803D674
sub_0803D674: @ 0x0803D674
	ldr r0, _0803D680 @ =0x030013DA
	ldr r1, _0803D684 @ =0x030013D8
	ldrh r1, [r1]
	strh r1, [r0]
	bx lr
	.align 2, 0
_0803D680: .4byte 0x030013DA
_0803D684: .4byte 0x030013D8

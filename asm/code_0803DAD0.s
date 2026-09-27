	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DAD0
sub_0803DAD0: @ 0x0803DAD0
	ldr r0, _0803DAE0 @ =0x03002870
	ldrh r1, [r0, #0x20]
	adds r1, #1
	strh r1, [r0, #0x20]
	ldrh r1, [r0, #0x24]
	subs r1, #1
	strh r1, [r0, #0x24]
	bx lr
	.align 2, 0
_0803DAE0: .4byte 0x03002870

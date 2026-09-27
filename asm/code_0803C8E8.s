	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803C8E8
sub_0803C8E8: @ 0x0803C8E8
	ldr r1, _0803C900 @ =0x0400010E
	movs r0, #0
	strh r0, [r1]
	ldr r2, _0803C904 @ =0x04000128
	ldr r1, _0803C908 @ =0x030013C8
	movs r3, #0xc1
	lsls r3, r3, #7
	adds r0, r3, #0
	ldrb r1, [r1]
	orrs r0, r1
	strh r0, [r2]
	bx lr
	.align 2, 0
_0803C900: .4byte 0x0400010E
_0803C904: .4byte 0x04000128
_0803C908: .4byte 0x030013C8

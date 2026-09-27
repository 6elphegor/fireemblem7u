	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBanimLinkArenaFlag
SetBanimLinkArenaFlag: @ 0x0804B194
	ldr r1, _0804B19C @ =0x0203DFFC
	str r0, [r1]
	bx lr
	.align 2, 0
_0804B19C: .4byte 0x0203DFFC

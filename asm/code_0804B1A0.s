	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBanimLinkArenaFlag
GetBanimLinkArenaFlag: @ 0x0804B1A0
	ldr r0, _0804B1A8 @ =0x0203DFFC
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804B1A8: .4byte 0x0203DFFC

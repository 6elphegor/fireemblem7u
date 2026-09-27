	.include "macro.inc"

	.syntax unified

	thumb_func_start CountTargets
CountTargets: @ 0x0804B174
	ldr r0, _0804B17C @ =0x0203DFF8
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0804B17C: .4byte 0x0203DFF8

	.include "macro.inc"

	.syntax unified

	thumb_func_start BeginTargetList
BeginTargetList: @ 0x0804ACE4
	ldr r2, _0804ACF4 @ =0x0203DCF4
	movs r3, #0
	strh r0, [r2]
	strh r1, [r2, #2]
	ldr r0, _0804ACF8 @ =0x0203DFF8
	str r3, [r0]
	bx lr
	.align 2, 0
_0804ACF4: .4byte 0x0203DCF4
_0804ACF8: .4byte 0x0203DFF8

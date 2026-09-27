	.include "macro.inc"

	.syntax unified

	thumb_func_start IsChapterStatsValid
IsChapterStatsValid: @ 0x0809FB30
	ldr r1, _0809FB40 @ =0x0000FF80
	ldrh r0, [r0]
	ands r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr
	.align 2, 0
_0809FB40: .4byte 0x0000FF80

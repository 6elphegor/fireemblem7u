	.include "macro.inc"

	.syntax unified

	thumb_func_start SortUnitList_GetUnitSoloAnimation
SortUnitList_GetUnitSoloAnimation: @ 0x0808B5D4
	ldr r0, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #8
	ands r0, r1
	bx lr
	.align 2, 0

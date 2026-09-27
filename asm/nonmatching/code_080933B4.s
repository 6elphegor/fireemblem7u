	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepUnit_DrawLeftUnitNameCur
PrepUnit_DrawLeftUnitNameCur: @ 0x080933B4
	push {lr}
	ldrh r0, [r0, #0x2e]
	bl GetUnitFromPrepList
	bl PrepUnit_DrawLeftUnitName
	pop {r0}
	bx r0

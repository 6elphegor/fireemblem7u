	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBonuses
InitBonuses: @ 0x08026A08
	movs r1, #0
	strb r1, [r0, #1]
	strb r1, [r0, #2]
	strb r1, [r0, #3]
	strb r1, [r0, #4]
	strb r1, [r0, #5]
	strb r1, [r0, #6]
	bx lr

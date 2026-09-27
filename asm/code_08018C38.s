	.include "macro.inc"

	.syntax unified

	thumb_func_start SetUnitLeaderCharId
SetUnitLeaderCharId: @ 0x08018C38
	adds r0, #0x38
	strb r1, [r0]
	bx lr
	.align 2, 0

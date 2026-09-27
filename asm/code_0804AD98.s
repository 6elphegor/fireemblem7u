	.include "macro.inc"

	.syntax unified

	thumb_func_start TargetSelection_GetRealCursorPosition
TargetSelection_GetRealCursorPosition: @ 0x0804AD98
	ldr r3, [r0, #0x30]
	movs r0, #0
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r1]
	movs r0, #1
	ldrsb r0, [r3, r0]
	lsls r0, r0, #4
	str r0, [r2]
	bx lr

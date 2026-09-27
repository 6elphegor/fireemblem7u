	.include "macro.inc"

	.syntax unified

	thumb_func_start TryLockProc
TryLockProc: @ 0x08090CD4
	cmp r0, #0
	beq _08090CE2
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_08090CE2:
	bx lr

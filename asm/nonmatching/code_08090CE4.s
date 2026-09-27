	.include "macro.inc"

	.syntax unified

	thumb_func_start TryUnlockProc
TryUnlockProc: @ 0x08090CE4
	cmp r0, #0
	beq _08090CF6
	adds r1, r0, #0
	adds r1, #0x28
	ldrb r0, [r1]
	cmp r0, #0
	beq _08090CF6
	subs r0, #1
	strb r0, [r1]
_08090CF6:
	bx lr

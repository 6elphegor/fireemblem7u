	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_TutorialWait_OnLoop
TradeMenu_TutorialWait_OnLoop: @ 0x0802B808
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802B822
	adds r0, r2, #0
	bl Proc_Break
_0802B822:
	pop {r0}
	bx r0
	.align 2, 0

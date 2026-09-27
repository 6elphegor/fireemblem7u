	.include "macro.inc"

	.syntax unified

	thumb_func_start TradeMenu_TutorialWait_OnInit
TradeMenu_TutorialWait_OnInit: @ 0x0802B800
	adds r0, #0x4c
	movs r1, #0x14
	strh r1, [r0]
	bx lr

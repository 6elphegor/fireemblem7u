	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearTalkBubble
EvtCmd_ClearTalkBubble: @ 0x0800BE20
	push {lr}
	bl ClearTalkBubble
	movs r0, #0
	pop {r1}
	bx r1

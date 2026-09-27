	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_TutorialCursorsTargetMove
EvtCmd_TutorialCursorsTargetMove: @ 0x0800FD50
	push {lr}
	movs r0, #0
	bl StartTutorialCursors
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

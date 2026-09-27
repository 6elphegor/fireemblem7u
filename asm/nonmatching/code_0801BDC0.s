	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugContinueMenu_ReleaseEntry
DebugContinueMenu_ReleaseEntry: @ 0x0801BDC0
	push {lr}
	bl StartGame
	movs r0, #7
	pop {r1}
	bx r1

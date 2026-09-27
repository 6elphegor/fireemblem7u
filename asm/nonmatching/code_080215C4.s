	.include "macro.inc"

	.syntax unified

	thumb_func_start MapMenu_StatusCommand
MapMenu_StatusCommand: @ 0x080215C4
	push {lr}
	movs r0, #0
	bl NewChapterStatusScreen
	movs r0, #0x17
	pop {r1}
	bx r1
	.align 2, 0

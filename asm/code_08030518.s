	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepScreenProc_InitMapMenu
PrepScreenProc_InitMapMenu: @ 0x08030518
	push {lr}
	movs r1, #1
	str r1, [r0, #0x58]
	bl PrepScreenProc_StartMapMenu
	pop {r0}
	bx r0
	.align 2, 0

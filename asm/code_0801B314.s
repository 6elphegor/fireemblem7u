	.include "macro.inc"

	.syntax unified

	thumb_func_start StartDebugMenu
StartDebugMenu: @ 0x0801B314
	push {lr}
	bl EndMenu
	bl ClearUi
	ldr r0, _0801B334 @ =0x08B958D8
	bl StartMenu
	movs r0, #2
	movs r1, #0
	bl DebugInitBg
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0801B334: .4byte 0x08B958D8

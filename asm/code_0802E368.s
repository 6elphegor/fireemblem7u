	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshBMapGraphics
RefreshBMapGraphics: @ 0x0802E368
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	bl InitMoreBMapGraphics
	pop {r0}
	bx r0

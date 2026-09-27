	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplySystemGraphics
ApplySystemGraphics: @ 0x080155CC
	push {lr}
	bl ResetText
	bl UnpackUiWindowFrameGraphics
	bl InitFaces
	bl InitIcons
	movs r0, #4
	bl ApplyIconPalettes
	bl ApplySystemObjectsGraphics
	pop {r0}
	bx r0

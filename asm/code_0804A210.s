	.include "macro.inc"

	.syntax unified

	thumb_func_start UnpackUiWindowFrameGraphics
UnpackUiWindowFrameGraphics: @ 0x0804A210
	push {lr}
	movs r0, #0
	bl UnpackUiWindowFrameImg
	movs r0, #1
	rsbs r0, r0, #0
	bl ApplyUiWindowFramePal
	pop {r0}
	bx r0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08033C28
sub_08033C28: @ 0x08033C28
	push {lr}
	movs r0, #1
	rsbs r0, r0, #0
	bl UnpackUiWindowFrameGraphics2
	pop {r0}
	bx r0
	.align 2, 0

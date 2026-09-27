	.include "macro.inc"

	.syntax unified

	thumb_func_start WindowColorOptionChangeHandler
WindowColorOptionChangeHandler: @ 0x080AE1FC
	push {lr}
	bl GenericOptionChangeHandler
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AE210
	movs r0, #1
	rsbs r0, r0, #0
	bl UnpackUiWindowFrameGraphics2
_080AE210:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

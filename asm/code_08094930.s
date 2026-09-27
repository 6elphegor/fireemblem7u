	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08094930
sub_08094930: @ 0x08094930
	push {lr}
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #1
	bl EndFaceById
	pop {r0}
	bx r0
	.align 2, 0

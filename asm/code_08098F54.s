	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08098F54
sub_08098F54: @ 0x08098F54
	push {lr}
	bl sub_080A9D08
	bl EndMuralBackground_
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl SetOnHBlankA
	pop {r0}
	bx r0
	.align 2, 0

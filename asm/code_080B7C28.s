	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7C28
sub_080B7C28: @ 0x080B7C28
	push {lr}
	bl EndAllProcChildren
	movs r0, #0
	bl SetOnHBlankA
	bl WipeAllPalette
	pop {r0}
	bx r0

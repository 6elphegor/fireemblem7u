	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMixPalette
EndMixPalette: @ 0x080AA964
	push {lr}
	ldr r0, _080AA974 @ =0x08CE4CD8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080AA974: .4byte 0x08CE4CD8

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7BC8
sub_080B7BC8: @ 0x080B7BC8
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B7BD8 @ =0x08CEDD40
	movs r1, #8
	bl StartEpilogueText
	pop {r0}
	bx r0
	.align 2, 0
_080B7BD8: .4byte 0x08CEDD40

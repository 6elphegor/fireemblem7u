	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5630
sub_080B5630: @ 0x080B5630
	push {lr}
	bl sub_08004234
	bl sub_080B4F58
	movs r0, #0
	bl WmSetUnk02
	pop {r0}
	bx r0

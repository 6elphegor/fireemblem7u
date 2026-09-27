	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801550C
sub_0801550C: @ 0x0801550C
	push {lr}
	bl HideAllUnits
	movs r0, #0x91
	bl ClearFlag
	pop {r0}
	bx r0

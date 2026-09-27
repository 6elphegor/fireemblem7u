	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080143A0
sub_080143A0: @ 0x080143A0
	push {lr}
	movs r0, #0x10
	movs r1, #0x10
	movs r2, #0
	bl sub_08002338
	bl sub_080143C4
	pop {r0}
	bx r0

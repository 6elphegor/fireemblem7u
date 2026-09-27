	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079C30
sub_08079C30: @ 0x08079C30
	push {lr}
	bl GetGold
	ldr r1, _08079C44 @ =0x00001388
	adds r0, r0, r1
	bl SetGold
	pop {r0}
	bx r0
	.align 2, 0
_08079C44: .4byte 0x00001388

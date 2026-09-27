	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079C48
sub_08079C48: @ 0x08079C48
	push {r4, lr}
	adds r4, r0, #0
	bl GetGold
	cmp r0, r4
	blt _08079C5E
	bl GetGold
	subs r0, r0, r4
	bl SetGold
_08079C5E:
	pop {r4}
	pop {r0}
	bx r0

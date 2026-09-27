	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08055720
sub_08055720: @ 0x08055720
	push {r4, lr}
	adds r4, r0, #0
	bl NewEkrTogiColor
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

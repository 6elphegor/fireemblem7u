	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045540
sub_08045540: @ 0x08045540
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0803CDB8
	cmp r0, #7
	bgt _08045552
	adds r0, r4, #0
	bl Proc_Break
_08045552:
	pop {r4}
	pop {r0}
	bx r0

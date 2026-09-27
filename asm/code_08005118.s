	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08005118
sub_08005118: @ 0x08005118
	push {r4, lr}
	adds r4, r1, #0
	bl sub_080050CC
	ldr r0, _08005130 @ =0x02028D4C
	subs r0, r0, r4
	bl sub_08005134
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08005130: .4byte 0x02028D4C

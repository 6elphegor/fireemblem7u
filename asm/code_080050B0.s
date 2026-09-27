	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080050B0
sub_080050B0: @ 0x080050B0
	push {r4, lr}
	adds r4, r1, #0
	bl sub_08005044
	ldr r0, _080050C8 @ =0x02028D4C
	subs r0, r0, r4
	bl sub_08005134
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080050C8: .4byte 0x02028D4C

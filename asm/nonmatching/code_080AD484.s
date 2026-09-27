	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AD484
sub_080AD484: @ 0x080AD484
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	beq _080AD496
	bl Proc_End
	movs r0, #0
	str r0, [r4, #0x34]
_080AD496:
	pop {r4}
	pop {r0}
	bx r0

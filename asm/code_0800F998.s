	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F998
sub_0800F998: @ 0x0800F998
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800F9AA
	bl nullsub_6
_0800F9AA:
	movs r0, #0
	pop {r1}
	bx r1

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08088A90
sub_08088A90: @ 0x08088A90
	push {lr}
	bl GetCgTextFlags
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	bne _08088AA2
	movs r0, #0
	b _08088AA4
_08088AA2:
	movs r0, #1
_08088AA4:
	pop {r1}
	bx r1

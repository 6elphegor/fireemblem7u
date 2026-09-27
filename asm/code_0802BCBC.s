	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802BCBC
sub_0802BCBC: @ 0x0802BCBC
	push {lr}
	bl GetTrapAt
	cmp r0, #0
	beq _0802BCCA
	ldrb r0, [r0, #3]
	b _0802BCCC
_0802BCCA:
	movs r0, #0
_0802BCCC:
	pop {r1}
	bx r1

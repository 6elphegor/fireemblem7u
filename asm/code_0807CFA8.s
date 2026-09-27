	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CFA8
sub_0807CFA8: @ 0x0807CFA8
	push {lr}
	bl sub_0807A03C
	movs r1, #0
	cmp r0, #1
	bgt _0807CFB6
	movs r1, #1
_0807CFB6:
	adds r0, r1, #0
	pop {r1}
	bx r1

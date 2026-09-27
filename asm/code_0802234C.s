	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802234C
sub_0802234C: @ 0x0802234C
	push {lr}
	adds r1, #0x3c
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl UpdateMenuItemPanel
	pop {r1}
	bx r1

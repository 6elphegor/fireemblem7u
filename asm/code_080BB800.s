	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB800
sub_080BB800: @ 0x080BB800
	push {r4, lr}
	adds r4, r0, #0
	bl sub_08002C74
	adds r4, #0x44
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

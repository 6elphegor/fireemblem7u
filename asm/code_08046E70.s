	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046E70
sub_08046E70: @ 0x08046E70
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndMu
	pop {r0}
	bx r0

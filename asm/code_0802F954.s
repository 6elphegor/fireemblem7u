	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802F954
sub_0802F954: @ 0x0802F954
	push {lr}
	ldr r0, [r0, #0x54]
	bl EndMu
	pop {r0}
	bx r0

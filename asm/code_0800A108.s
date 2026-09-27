	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800A108
sub_0800A108: @ 0x0800A108
	push {lr}
	ldr r0, _0800A118 @ =sub_0800A0FC
	movs r1, #1
	bl CallDelayed
	pop {r0}
	bx r0
	.align 2, 0
_0800A118: .4byte sub_0800A0FC

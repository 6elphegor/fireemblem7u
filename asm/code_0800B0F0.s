	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800B0F0
sub_0800B0F0: @ 0x0800B0F0
	push {r4, lr}
	adds r4, r0, #0
	bl LockGame
	movs r0, #0
	str r0, [r4, #0x40]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

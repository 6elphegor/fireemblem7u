	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4A0C
sub_080A4A0C: @ 0x080A4A0C
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	movs r2, #2
	bl StartSqMask
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0

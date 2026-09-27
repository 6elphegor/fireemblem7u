	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCDB4
sub_080BCDB4: @ 0x080BCDB4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x3c]
	adds r1, #1
	str r1, [r2, #0x3c]
	ldr r0, [r2, #0x2c]
	ldr r0, [r0, #8]
	subs r0, #0x20
	cmp r1, r0
	blt _080BCDD2
	movs r0, #0
	str r0, [r2, #0x3c]
	adds r0, r2, #0
	bl Proc_Break
_080BCDD2:
	pop {r0}
	bx r0
	.align 2, 0

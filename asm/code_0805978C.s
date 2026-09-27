	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805978C
sub_0805978C: @ 0x0805978C
	push {lr}
	ldr r2, _080597A0 @ =0x0201774C
	ldr r1, [r2]
	subs r1, #1
	str r1, [r2]
	ldr r0, [r0, #0x60]
	bl AnimDelete
	pop {r0}
	bx r0
	.align 2, 0
_080597A0: .4byte 0x0201774C

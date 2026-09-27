	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A9500
sub_080A9500: @ 0x080A9500
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080A9518 @ =0x08CE4AC8
	bl Proc_Find
	cmp r0, #0
	beq _080A9510
	str r4, [r0, #0x30]
_080A9510:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A9518: .4byte 0x08CE4AC8

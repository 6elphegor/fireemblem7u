	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7B7C
sub_080A7B7C: @ 0x080A7B7C
	push {lr}
	ldr r0, _080A7B94 @ =0x08CE48F0
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080A7B8E
	movs r0, #1
	str r0, [r1, #0x2c]
_080A7B8E:
	pop {r0}
	bx r0
	.align 2, 0
_080A7B94: .4byte 0x08CE48F0

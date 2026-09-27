	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7B98
sub_080A7B98: @ 0x080A7B98
	push {lr}
	ldr r0, _080A7BB0 @ =0x08CE48F0
	bl Proc_Find
	cmp r0, #0
	beq _080A7BAC
	adds r1, r0, #0
	adds r1, #0x3c
	movs r0, #1
	strb r0, [r1]
_080A7BAC:
	pop {r0}
	bx r0
	.align 2, 0
_080A7BB0: .4byte 0x08CE48F0

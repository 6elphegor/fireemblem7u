	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeOutExists
FadeOutExists: @ 0x080AA284
	push {lr}
	ldr r0, _080AA298 @ =0x08CE4C80
	bl Proc_Find
	cmp r0, #0
	beq _080AA292
	movs r0, #1
_080AA292:
	pop {r1}
	bx r1
	.align 2, 0
_080AA298: .4byte 0x08CE4C80

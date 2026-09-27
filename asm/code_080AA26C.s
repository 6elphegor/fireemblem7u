	.include "macro.inc"

	.syntax unified

	thumb_func_start FadeInExists
FadeInExists: @ 0x080AA26C
	push {lr}
	ldr r0, _080AA280 @ =0x08CE4C50
	bl Proc_Find
	cmp r0, #0
	beq _080AA27A
	movs r0, #1
_080AA27A:
	pop {r1}
	bx r1
	.align 2, 0
_080AA280: .4byte 0x08CE4C50

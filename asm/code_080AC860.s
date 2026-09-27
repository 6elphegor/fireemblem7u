	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC860
sub_080AC860: @ 0x080AC860
	push {lr}
	ldr r0, _080AC870 @ =0x08CE5704
	bl Proc_Find
	cmp r0, #0
	bne _080AC874
	movs r0, #0
	b _080AC876
	.align 2, 0
_080AC870: .4byte 0x08CE5704
_080AC874:
	movs r0, #1
_080AC876:
	pop {r1}
	bx r1
	.align 2, 0

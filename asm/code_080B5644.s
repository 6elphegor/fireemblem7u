	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B5644
sub_080B5644: @ 0x080B5644
	push {lr}
	ldr r0, _080B5658 @ =0x08CE76E8
	bl Proc_Find
	cmp r0, #0
	beq _080B5652
	movs r0, #1
_080B5652:
	pop {r1}
	bx r1
	.align 2, 0
_080B5658: .4byte 0x08CE76E8

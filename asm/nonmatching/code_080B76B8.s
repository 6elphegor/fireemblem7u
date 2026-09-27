	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B76B8
sub_080B76B8: @ 0x080B76B8
	push {r4, lr}
	adds r4, r0, #0
	bl EndAllProcChildren
	ldr r0, [r4, #0x34]
	ldm r0!, {r1}
	str r0, [r4, #0x34]
	cmp r1, #0
	beq _080B76D2
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B76D2:
	pop {r4}
	pop {r0}
	bx r0

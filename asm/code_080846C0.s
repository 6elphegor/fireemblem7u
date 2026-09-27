	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080846C0
sub_080846C0: @ 0x080846C0
	push {lr}
	ldr r0, _080846D0 @ =0x08CC2B84
	bl Proc_Find
	cmp r0, #0
	bne _080846D4
	movs r0, #0
	b _080846D6
	.align 2, 0
_080846D0: .4byte 0x08CC2B84
_080846D4:
	movs r0, #1
_080846D6:
	pop {r1}
	bx r1
	.align 2, 0

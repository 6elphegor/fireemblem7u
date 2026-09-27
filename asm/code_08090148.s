	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090148
sub_08090148: @ 0x08090148
	push {lr}
	ldr r0, _08090158 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	bne _0809015C
	movs r0, #0
	b _0809015E
	.align 2, 0
_08090158: .4byte 0x08CC416C
_0809015C:
	movs r0, #1
_0809015E:
	pop {r1}
	bx r1
	.align 2, 0

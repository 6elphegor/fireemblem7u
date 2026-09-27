	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809019C
sub_0809019C: @ 0x0809019C
	push {lr}
	ldr r0, _080901B4 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _080901AE
	movs r1, #1
	bl Proc_Goto
_080901AE:
	pop {r0}
	bx r0
	.align 2, 0
_080901B4: .4byte 0x08CC416C

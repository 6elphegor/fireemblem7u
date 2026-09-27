	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090180
sub_08090180: @ 0x08090180
	push {lr}
	ldr r0, _08090198 @ =0x08CC416C
	bl Proc_Find
	cmp r0, #0
	beq _08090192
	movs r1, #0
	bl Proc_Goto
_08090192:
	pop {r0}
	bx r0
	.align 2, 0
_08090198: .4byte 0x08CC416C

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082FF0
sub_08082FF0: @ 0x08082FF0
	push {lr}
	ldr r0, _08083004 @ =0x08CC2A04
	bl Proc_Find
	cmp r0, #0
	beq _08082FFE
	movs r0, #1
_08082FFE:
	pop {r1}
	bx r1
	.align 2, 0
_08083004: .4byte 0x08CC2A04

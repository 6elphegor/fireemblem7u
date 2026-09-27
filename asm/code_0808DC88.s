	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808DC88
sub_0808DC88: @ 0x0808DC88
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

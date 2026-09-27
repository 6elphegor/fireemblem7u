	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808DC3C
sub_0808DC3C: @ 0x0808DC3C
	push {lr}
	movs r1, #5
	bl Proc_Goto
	pop {r0}
	bx r0

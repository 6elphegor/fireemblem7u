	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808E624
sub_0808E624: @ 0x0808E624
	push {lr}
	bl DrawPrepMenuDescTexts
	pop {r0}
	bx r0
	.align 2, 0

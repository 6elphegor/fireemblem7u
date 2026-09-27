	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808E5FC
sub_0808E5FC: @ 0x0808E5FC
	push {lr}
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bl ResetPrepMenuDescTexts
	pop {r0}
	bx r0

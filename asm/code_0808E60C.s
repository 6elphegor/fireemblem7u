	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808E60C
sub_0808E60C: @ 0x0808E60C
	push {lr}
	ldr r0, [r0, #0x58]
	bl DecodeMsg
	pop {r0}
	bx r0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808E618
sub_0808E618: @ 0x0808E618
	push {lr}
	ldr r0, [r0, #0x58]
	bl ParsePrepMenuDescTexts
	pop {r0}
	bx r0

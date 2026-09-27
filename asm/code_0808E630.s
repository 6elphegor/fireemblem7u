	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepMenuDescHandler
StartPrepMenuDescHandler: @ 0x0808E630
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0808E658 @ =0x08CC3B9C
	adds r0, r5, #0
	bl Proc_Find
	cmp r0, #0
	beq _0808E646
	bl Proc_End
_0808E646:
	adds r0, r5, #0
	adds r1, r4, #0
	bl Proc_Start
	str r6, [r0, #0x58]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E658: .4byte 0x08CC3B9C

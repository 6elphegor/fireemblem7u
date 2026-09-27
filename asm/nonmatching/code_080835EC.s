	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMergeBoxDialogue
EndMergeBoxDialogue: @ 0x080835EC
	push {lr}
	bl sub_0808460C
	ldr r0, _080835FC @ =0x08CC2AAC
	bl Proc_BreakEach
	pop {r0}
	bx r0
	.align 2, 0
_080835FC: .4byte 0x08CC2AAC

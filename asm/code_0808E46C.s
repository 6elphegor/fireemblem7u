	.include "macro.inc"

	.syntax unified

	thumb_func_start EndMuralBackground_
EndMuralBackground_: @ 0x0808E46C
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E47E
	bl EndMuralBackground
	b _0808E482
_0808E47E:
	bl EndPrepMuralBackground
_0808E482:
	pop {r0}
	bx r0
	.align 2, 0

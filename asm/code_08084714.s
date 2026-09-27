	.include "macro.inc"

	.syntax unified

	thumb_func_start GetWindowQuadrant
GetWindowQuadrant: @ 0x08084714
	cmp r0, #0
	bge _08084724
	cmp r1, #0
	bge _08084720
	movs r0, #0
	b _0808472E
_08084720:
	movs r0, #1
	b _0808472E
_08084724:
	cmp r1, #0
	blt _0808472C
	movs r0, #3
	b _0808472E
_0808472C:
	movs r0, #2
_0808472E:
	bx lr

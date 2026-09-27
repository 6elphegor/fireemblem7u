	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepRestartMuralBackground
PrepRestartMuralBackground: @ 0x0808E448
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E460
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackgroundAlt
	b _0808E468
_0808E460:
	movs r0, #0
	movs r1, #0xa
	bl StartPrepMuralBackground
_0808E468:
	pop {r0}
	bx r0

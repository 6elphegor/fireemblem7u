	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808EE98
sub_0808EE98: @ 0x0808EE98
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EEAC
	bl LockGame
	bl LockBmDisplay
_0808EEAC:
	pop {r0}
	bx r0

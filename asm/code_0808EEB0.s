	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_UnlockGame
AtMenu_UnlockGame: @ 0x0808EEB0
	push {lr}
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0808EEC4
	bl UnlockBmDisplay
	bl UnlockGame
_0808EEC4:
	pop {r0}
	bx r0

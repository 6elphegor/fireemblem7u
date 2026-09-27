	.include "macro.inc"

	.syntax unified

	thumb_func_start PlaySeDelayed
PlaySeDelayed: @ 0x08014DE0
	push {lr}
	adds r3, r0, #0
	adds r2, r1, #0
	ldr r0, _08014DF4 @ =PlaySeFunc
	adds r1, r3, #0
	bl CallDelayedArg
	pop {r0}
	bx r0
	.align 2, 0
_08014DF4: .4byte PlaySeFunc

	.include "macro.inc"

	.syntax unified

	thumb_func_start ProcPrepSpChar_Idle
ProcPrepSpChar_Idle: @ 0x0808FA48
	push {r4, lr}
	adds r4, r0, #0
	bl PrepScreenSprite_OnDraw
	ldrh r0, [r4, #0x34]
	adds r0, #1
	strh r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0

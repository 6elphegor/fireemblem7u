	.include "macro.inc"

	.syntax unified

	thumb_func_start GameOverScreen_BeginIdle
GameOverScreen_BeginIdle: @ 0x08020388
	adds r0, #0x4e
	ldr r1, _08020390 @ =0x000005DC
	strh r1, [r0]
	bx lr
	.align 2, 0
_08020390: .4byte 0x000005DC

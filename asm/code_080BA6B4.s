	.include "macro.inc"

	.syntax unified

	thumb_func_start Title_InitDisp
Title_InitDisp: @ 0x080BA6B4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #1
	bl Title_InitSpriteAnim
	adds r0, r4, #0
	bl Title_InitBg
	movs r0, #0xe
	bl EnableBgSync
	adds r0, r4, #0
	bl Title_StartTextFlame
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

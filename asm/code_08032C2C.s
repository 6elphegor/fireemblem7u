	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_BlendSpriteAnim_InitOut
StatusHealEffect_BlendSpriteAnim_InitOut: @ 0x08032C2C
	adds r2, r0, #0
	adds r2, #0x4c
	movs r1, #0xf
	strh r1, [r2]
	movs r1, #0x10
	str r1, [r0, #0x2c]
	subs r1, #0x11
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

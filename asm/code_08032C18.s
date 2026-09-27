	.include "macro.inc"

	.syntax unified

	thumb_func_start StatusHealEffect_BlendSpriteAnim_InitIn
StatusHealEffect_BlendSpriteAnim_InitIn: @ 0x08032C18
	adds r2, r0, #0
	adds r2, #0x4c
	movs r3, #0
	movs r1, #0xf
	strh r1, [r2]
	str r3, [r0, #0x2c]
	movs r1, #1
	str r1, [r0, #0x34]
	bx lr
	.align 2, 0

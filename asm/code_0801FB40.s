	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_801FFA8
ChapterIntro_801FFA8: @ 0x0801FB40
	push {lr}
	movs r0, #0
	bl InitBgs
	bl ApplySystemGraphics
	ldr r0, _0801FB64 @ =0x0202BBF8
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
_0801FB64: .4byte 0x0202BBF8

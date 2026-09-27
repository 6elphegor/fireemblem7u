	.include "macro.inc"

	.syntax unified

	thumb_func_start InitMoreBMapGraphics
InitMoreBMapGraphics: @ 0x0802E338
	push {r4, lr}
	ldr r4, _0802E364 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	bl ForceSyncUnitSpriteSheet
	bl InitSystemTextFont
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802E364: .4byte 0x0202BBF8

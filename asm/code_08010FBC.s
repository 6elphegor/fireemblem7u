	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010FBC
sub_08010FBC: @ 0x08010FBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08011004 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	ldr r0, [r5, #0x34]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08010FEC
	bl sub_08024CE0
_08010FEC:
	bl ForceSyncUnitSpriteSheet
	bl UnlockBmDisplay
	bl ReleaseMus
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011004: .4byte 0x0202BBF8

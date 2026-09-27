	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809CAB8
sub_0809CAB8: @ 0x0809CAB8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl ResetUnitSprites
	movs r4, #0
	b _0809CAE0
_0809CAC4:
	ldr r0, [r5, #0x2c]
	adds r1, r4, #0
	bl GetSupportScreenPartnerClassId
	adds r1, r5, #0
	adds r1, #0x4e
	adds r1, r1, r4
	strb r0, [r1]
	ldrb r0, [r1]
	bl GetClassSMSId
	bl UseUnitSprite
	adds r4, #1
_0809CAE0:
	adds r0, r5, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _0809CAC4
	bl ForceSyncUnitSpriteSheet
	movs r4, #0
	adds r0, r5, #0
	adds r0, #0x3c
	adds r6, r0, #0
	b _0809CB02
_0809CAF8:
	adds r0, r5, #0
	adds r1, r4, #0
	bl DrawSupportSubScreenUnitPartnerText
	adds r4, #1
_0809CB02:
	ldrb r0, [r6]
	cmp r4, r0
	blt _0809CAF8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

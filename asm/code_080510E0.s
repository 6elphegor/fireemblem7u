	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080510E0
sub_080510E0: @ 0x080510E0
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	movs r0, #0xf
	strh r0, [r5, #0x2e]
	bl ResetUnitSprites
	bl BMapDispResume_FromBattleDelayed
	bl RefreshUnitSprites
	bl ForceSyncUnitSpriteSheet
	bl ApplyUnitSpritePalettes
	ldr r2, _08051168 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0xc0
	ldrb r3, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	adds r1, #0xa
	movs r0, #4
	strb r0, [r1]
	ldr r0, _0805116C @ =0x0000FFE0
	ldrh r1, [r2, #0x3c]
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strh r0, [r2, #0x3c]
	adds r1, r2, #0
	adds r1, #0x34
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r1, #2
	movs r0, #0x20
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	beq _08051150
	bl UnpackChapterMapPalette
_08051150:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _0805115C
	bl LoadLinkArenaFogPlaceholder
_0805115C:
	adds r0, r5, #0
	bl Proc_Break
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08051168: .4byte 0x03002870
_0805116C: .4byte 0x0000FFE0

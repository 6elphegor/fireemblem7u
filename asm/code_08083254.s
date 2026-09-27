	.include "macro.inc"

	.syntax unified

	thumb_func_start InitBoxDialogue
InitBoxDialogue: @ 0x08083254
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	cmp r6, #0
	bne _08083260
	ldr r6, _08083284 @ =0x06013000
_08083260:
	cmp r5, #0
	bge _08083266
	movs r5, #5
_08083266:
	movs r0, #0xf
	ands r0, r5
	adds r5, r0, #0
	adds r5, #0x10
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0808328C
	ldr r0, _08083288 @ =0x083FD884
	adds r1, r6, #0
	bl Decompress
	b _08083294
	.align 2, 0
_08083284: .4byte 0x06013000
_08083288: .4byte 0x083FD884
_0808328C:
	ldr r0, _08083308 @ =0x083FD764
	adds r1, r6, #0
	bl Decompress
_08083294:
	bl ClearAllTalkFlags
	bl GetDialogueBoxConfig
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _08083324
	ldr r4, _0808330C @ =0x0203E6F4
	adds r0, r4, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	adds r0, r4, #0
	adds r0, #0x18
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x20
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x28
	bl InitSpriteText
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _080832F0
	bl GetDialogueBoxConfig
	movs r1, #0x20
	ands r1, r0
	cmp r1, #0
	bne _080832F0
	adds r0, r4, #0
	adds r0, #0x30
	bl InitSpriteText
	adds r0, r4, #0
	adds r0, #0x38
	bl InitSpriteText
_080832F0:
	movs r0, #0
	bl SetTextFont
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083314
	ldr r0, _08083310 @ =0x081946F4
	b _08083316
	.align 2, 0
_08083308: .4byte 0x083FD764
_0808330C: .4byte 0x0203E6F4
_08083310: .4byte 0x081946F4
_08083314:
	ldr r0, _08083320 @ =0x081946D4
_08083316:
	lsls r1, r5, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	b _08083360
	.align 2, 0
_08083320: .4byte 0x081946D4
_08083324:
	ldr r0, _08083334 @ =0x0203E6F4
	adds r1, r6, #0
	adds r2, r5, #0
	bl InitSpriteTextFont
	movs r4, #0
	lsls r7, r5, #5
	b _08083344
	.align 2, 0
_08083334: .4byte 0x0203E6F4
_08083338:
	lsls r0, r4, #3
	ldr r1, _08083398 @ =0x0203E70C
	adds r0, r0, r1
	bl InitSpriteText
	adds r4, #1
_08083344:
	bl GetDialogueBoxConfig
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x18
	cmp r4, r0
	blt _08083338
	movs r0, #0
	bl SetTextFont
	ldr r0, _0808339C @ =0x08194674
	adds r1, r7, #0
	movs r2, #0x20
	bl ApplyPaletteExt
_08083360:
	ldr r2, _080833A0 @ =0x0203E6F4
	lsls r1, r6, #0x11
	lsrs r1, r1, #0x16
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	adds r1, r1, r0
	adds r2, #0x40
	strh r1, [r2]
	bl GetDialogueBoxConfig
	movs r1, #0x10
	ands r1, r0
	cmp r1, #0
	beq _08083390
	ldr r0, _080833A4 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08083390
	ldr r0, _080833A8 @ =0x000002E6
	bl m4aSongNumStart
_08083390:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08083398: .4byte 0x0203E70C
_0808339C: .4byte 0x08194674
_080833A0: .4byte 0x0203E6F4
_080833A4: .4byte 0x0202BBF8
_080833A8: .4byte 0x000002E6

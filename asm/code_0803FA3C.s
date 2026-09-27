	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803FA3C
sub_0803FA3C: @ 0x0803FA3C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r0, #0x40
	movs r1, #0x58
	bl PutLinkArenaChoiceBannerSprite
	ldr r0, _0803FACC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x20
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803FA6A
	adds r1, r5, #0
	adds r1, #0x3b
	ldrb r0, [r1]
	cmp r0, #1
	bne _0803FA6A
	movs r0, #0
	strb r0, [r1]
	movs r0, #3
	bl SioPlaySoundEffect
_0803FA6A:
	ldr r0, _0803FACC @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x10
	ldrh r1, [r1, #8]
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x3b
	cmp r0, #0
	beq _0803FA8C
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803FA8C
	movs r0, #1
	strb r0, [r4]
	movs r0, #3
	bl SioPlaySoundEffect
_0803FA8C:
	ldrb r1, [r4]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x50
	movs r1, #0x60
	bl PutUiHand
	ldr r0, _0803FACC @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0803FAD4
	movs r0, #1
	bl SioPlaySoundEffect
	ldr r0, _0803FAD0 @ =0x02022F76
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
	b _0803FB1A
	.align 2, 0
_0803FACC: .4byte 0x08B857F8
_0803FAD0: .4byte 0x02022F76
_0803FAD4:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FB1A
	ldrb r0, [r4]
	cmp r0, #0
	bne _0803FAFC
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _0803FAF8 @ =0x0203DC20
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _0803FB02
	.align 2, 0
_0803FAF8: .4byte 0x0203DC20
_0803FAFC:
	movs r0, #1
	bl SioPlaySoundEffect
_0803FB02:
	ldr r0, _0803FB20 @ =0x02022F76
	movs r1, #0xc
	movs r2, #2
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #1
	bl EnableBgSync
	adds r0, r5, #0
	bl Proc_Break
_0803FB1A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803FB20: .4byte 0x02022F76

	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginFastFadeToMap
ChapterIntro_BeginFastFadeToMap: @ 0x0801FF68
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ClearUi
	bl ColorFadeInit
	ldr r5, _08020004 @ =0x02022920
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, r2
	movs r1, #0x10
	movs r2, #2
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #2
	bl MaybeSmoothChangeSomePal
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0xe
	strh r0, [r4]
	ldr r4, _08020008 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r2, [r4, #0x1b]
	cmp r2, #3
	bne _0801FFD4
	movs r1, #2
_0801FFD4:
	adds r0, #0x28
	adds r0, r0, r1
	ldr r1, _0802000C @ =0x0000FFFF
	ldrh r0, [r0]
	cmp r0, r1
	beq _0801FFFE
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0801FFF2
	movs r1, #2
_0801FFF2:
	adds r0, #0x28
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0
	bl StartBgm
_0801FFFE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08020004: .4byte 0x02022920
_08020008: .4byte 0x0202BBF8
_0802000C: .4byte 0x0000FFFF

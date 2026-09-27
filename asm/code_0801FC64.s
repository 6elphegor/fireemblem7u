	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginFadeToMap
ChapterIntro_BeginFadeToMap: @ 0x0801FC64
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ColorFadeInit
	ldr r5, _0801FCD4 @ =0x02022920
	adds r0, r5, #0
	movs r1, #6
	movs r2, #0xa
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x1a
	movs r2, #6
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	movs r1, #0xa0
	lsls r1, r1, #1
	adds r0, r5, r1
	movs r1, #0x10
	movs r2, #2
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r5, r1
	movs r1, #0x17
	movs r2, #1
	movs r3, #1
	bl MaybeSmoothChangeSomePal
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r4, #0x4c
	movs r0, #0x1e
	strh r0, [r4]
	ldr r0, _0801FCD8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0801FCCE
	bl ApplyFlamesWeatherGradient
_0801FCCE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FCD4: .4byte 0x02022920
_0801FCD8: .4byte 0x0202BBF8

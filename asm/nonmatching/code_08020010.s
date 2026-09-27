	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_LoopFastFadeToMap
ChapterIntro_LoopFastFadeToMap: @ 0x08020010
	push {r4, r5, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	ldr r5, _08020064 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _0802002C
	bl ApplyFlamesWeatherGradient
_0802002C:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetChapterInfo
	adds r0, #0x8b
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802006C
	adds r3, r4, #0
	adds r3, #0x4c
	movs r0, #0
	strh r0, [r3]
	ldr r2, _08020068 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _08020074
	.align 2, 0
_08020064: .4byte 0x0202BBF8
_08020068: .4byte 0x03002870
_0802006C:
	bl EnablePalSync
	adds r3, r4, #0
	adds r3, #0x4c
_08020074:
	ldrh r0, [r3]
	subs r0, #1
	strh r0, [r3]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802008A
	bl EnableTilesetPalAnim
	adds r0, r4, #0
	bl Proc_Break
_0802008A:
	pop {r4, r5}
	pop {r0}
	bx r0

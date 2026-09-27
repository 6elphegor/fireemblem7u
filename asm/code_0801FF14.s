	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_LoopFadeOut
ChapterIntro_LoopFadeOut: @ 0x0801FF14
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeTick_thm
	bl EnablePalSync
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801FF5C
	ldr r2, _0801FF64 @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	bl SetBgChrOffset
	adds r0, r4, #0
	bl Proc_Break
_0801FF5C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FF64: .4byte 0x03002870

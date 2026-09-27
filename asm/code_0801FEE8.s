	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginFadeOut
ChapterIntro_BeginFadeOut: @ 0x0801FEE8
	push {r4, lr}
	adds r4, r0, #0
	bl ColorFadeInit
	ldr r0, _0801FF10 @ =0x02022860
	movs r3, #2
	rsbs r3, r3, #0
	movs r1, #0
	movs r2, #6
	bl MaybeSmoothChangeSomePal
	adds r4, #0x4c
	movs r0, #0xf
	strh r0, [r4]
	movs r0, #1
	bl Sound_FadeOutSE
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801FF10: .4byte 0x02022860

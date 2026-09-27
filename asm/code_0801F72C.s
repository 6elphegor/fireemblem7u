	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginFadeIn
ChapterIntro_BeginFadeIn: @ 0x0801F72C
	push {lr}
	ldr r3, _0801F768 @ =0x03002870
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	subs r2, #2
	ands r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	ldr r1, _0801F76C @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r1, r2
	movs r2, #0x18
	orrs r1, r2
	strh r1, [r3, #0x3c]
	adds r0, #0x4c
	movs r1, #0xc
	strh r1, [r0]
	movs r0, #2
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
_0801F768: .4byte 0x03002870
_0801F76C: .4byte 0x0000FFE0

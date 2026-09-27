	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_BeginMotifFadeIn
ChapterIntro_BeginMotifFadeIn: @ 0x0801F804
	push {lr}
	ldr r3, _0801F858 @ =0x03002870
	movs r1, #2
	rsbs r1, r1, #0
	ldrb r2, [r3, #1]
	ands r1, r2
	movs r2, #3
	rsbs r2, r2, #0
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	movs r2, #8
	orrs r1, r2
	movs r2, #0x10
	orrs r1, r2
	strb r1, [r3, #1]
	adds r0, #0x4c
	movs r1, #0x10
	strh r1, [r0]
	ldr r0, _0801F85C @ =0x0000FFE0
	ldrh r1, [r3, #0x3c]
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	ldr r1, _0801F860 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _0801F864 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801F854
	movs r0, #0x60
	bl m4aSongNumStart
_0801F854:
	pop {r0}
	bx r0
	.align 2, 0
_0801F858: .4byte 0x03002870
_0801F85C: .4byte 0x0000FFE0
_0801F860: .4byte 0x0000E0FF
_0801F864: .4byte 0x0202BBF8

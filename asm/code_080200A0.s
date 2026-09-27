	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_TickTimer
ChapterIntro_TickTimer: @ 0x080200A0
	push {lr}
	adds r3, r0, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _080200B4
	adds r0, r3, #0
	bl Proc_Break
	b _080200CA
_080200B4:
	adds r0, r3, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	subs r2, r1, #1
	strh r2, [r0]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _080200CA
	adds r0, r3, #0
	bl Proc_Break
_080200CA:
	pop {r0}
	bx r0
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_LoopMotifFadeIn
ChapterIntro_LoopMotifFadeIn: @ 0x0801F868
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _0801F8C4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0x10
	ldrb r1, [r4]
	subs r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	strb r0, [r1]
	adds r1, #1
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	adds r0, #0x50
	ldrh r0, [r0]
	cmp r0, #3
	beq _0801F8B2
	bl GetGameTime
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _0801F906
_0801F8B2:
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F8C8
	ldrh r0, [r4]
	subs r0, #4
	b _0801F8CC
	.align 2, 0
_0801F8C4: .4byte 0x03002870
_0801F8C8:
	ldrh r0, [r4]
	subs r0, #1
_0801F8CC:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bge _0801F906
	ldr r3, _0801F90C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	adds r0, r5, #0
	bl Proc_Break
_0801F906:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801F90C: .4byte 0x03002870

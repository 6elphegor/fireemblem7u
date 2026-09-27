	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_LoopFastCloseText
ChapterIntro_LoopFastCloseText: @ 0x0801FE9C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _0801FEE4 @ =0x03002870
	mov ip, r0
	mov r1, ip
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x4c
	ldrh r1, [r4]
	adds r2, r1, #0
	movs r0, #0x50
	subs r0, r0, r2
	mov r3, ip
	adds r3, #0x31
	strb r0, [r3]
	subs r3, #5
	movs r0, #0xf0
	strb r0, [r3]
	adds r2, #0x50
	mov r0, ip
	adds r0, #0x30
	strb r2, [r0]
	subs r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x10
	cmp r1, #0
	bge _0801FEDC
	adds r0, r5, #0
	bl Proc_Break
_0801FEDC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FEE4: .4byte 0x03002870

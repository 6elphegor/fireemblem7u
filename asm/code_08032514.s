	.include "macro.inc"

	.syntax unified

	thumb_func_start SubtitleHelp_Loop
SubtitleHelp_Loop: @ 0x08032514
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r1, _0803255C @ =0x08B96A0C
	adds r4, r5, #0
	adds r4, #0x5a
	movs r2, #0
	ldrsh r0, [r4, r2]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r5, #0
	bl PutSubtitleHelpText
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0
	beq _0803253A
	subs r0, r1, #1
	strh r0, [r4]
_0803253A:
	adds r1, r5, #0
	adds r1, #0x58
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08032556
	movs r0, #0x1f
	strh r0, [r1]
	adds r1, #4
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08032556:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0803255C: .4byte 0x08B96A0C

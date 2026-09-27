	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_NextChapter
EvtCmd_NextChapter: @ 0x0800E540
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldrh r5, [r0, #2]
	bl EndAllMus
	adds r0, r5, #0
	bl SetNextChapterId
	movs r0, #1
	bl SetNextGameAction
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #8
	ldrh r2, [r1]
	orrs r0, r2
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800E572
	adds r0, r4, #0
	bl StartSlowLockingFadeToBlack
_0800E572:
	cmp r5, #0x2f
	beq _0800E57C
	movs r0, #4
	bl FadeBgmOut
_0800E57C:
	movs r0, #2
	pop {r4, r5}
	pop {r1}
	bx r1

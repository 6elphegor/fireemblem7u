	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkShiftClearAll_OnIdle
TalkShiftClearAll_OnIdle: @ 0x08009388
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	ldrh r2, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBgOffset
	adds r0, r5, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r1, [r4, r2]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	blt _080093C4
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl ClearPutTalkText
	adds r0, r5, #0
	bl Proc_Break
_080093C4:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

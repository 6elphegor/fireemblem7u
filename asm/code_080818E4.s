	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBox_WaitClose
HelpBox_WaitClose: @ 0x080818E4
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #3
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08081904
	adds r0, r4, #0
	bl Proc_Break
_08081904:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

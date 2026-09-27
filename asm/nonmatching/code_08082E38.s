	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08082E38
sub_08082E38: @ 0x08082E38
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl UpdateHelpBoxDisplay
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08082E58
	adds r0, r4, #0
	bl Proc_Break
_08082E58:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start TalkPause_OnIdle
TalkPause_OnIdle: @ 0x0800920C
	push {r4, lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x64
	ldrh r3, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	bne _08009226
	adds r0, r2, #0
	bl Proc_Break
	b _0800922A
_08009226:
	subs r0, r3, #1
	strh r0, [r1]
_0800922A:
	pop {r4}
	pop {r0}
	bx r0

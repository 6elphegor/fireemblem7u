	.include "macro.inc"

	.syntax unified

	thumb_func_start MergeBoxDialogue3
MergeBoxDialogue3: @ 0x080835BC
	push {r4, lr}
	adds r4, r0, #0
	movs r1, #0
	bl sub_080834E0
	adds r1, r4, #0
	adds r1, #0x48
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _080835E2
	adds r0, r4, #0
	bl Proc_Break
	ldr r0, _080835E8 @ =0x08CC2B84
	bl Proc_EndEach
_080835E2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080835E8: .4byte 0x08CC2B84

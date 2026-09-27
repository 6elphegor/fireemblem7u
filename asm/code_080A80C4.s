	.include "macro.inc"

	.syntax unified

	thumb_func_start ModeSelect_TransitionSplitClose
ModeSelect_TransitionSplitClose: @ 0x080A80C4
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r4, r0, #1
	str r4, [r5, #0x2c]
	movs r1, #0x10
	subs r1, r1, r4
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #3
	muls r0, r1, r0
	cmp r0, #0
	bge _080A80E0
	adds r0, #0xff
_080A80E0:
	asrs r0, r0, #8
	movs r2, #0x48
	subs r2, r2, r0
	ldr r3, _080A811C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #8
	adds r1, #4
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	movs r1, #0x68
	rsbs r1, r1, #0
	adds r0, r1, #0
	subs r0, r0, r2
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	cmp r4, #0x10
	bne _080A8116
	adds r0, r5, #0
	bl Proc_Break
_080A8116:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A811C: .4byte 0x03002870

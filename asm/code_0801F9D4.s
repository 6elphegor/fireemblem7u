	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_LoopVOpenText
ChapterIntro_LoopVOpenText: @ 0x0801F9D4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #3
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl Interpolate
	ldr r3, _0801FA2C @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	movs r1, #0x50
	subs r1, r1, r0
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	adds r0, #0x50
	adds r1, r3, #0
	adds r1, #0x30
	strb r0, [r1]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #3
	ble _0801FA24
	adds r0, r5, #0
	bl Proc_Break
_0801FA24:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801FA2C: .4byte 0x03002870

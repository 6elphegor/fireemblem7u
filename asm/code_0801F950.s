	.include "macro.inc"

	.syntax unified

	thumb_func_start ChapterIntro_LoopHOpenText
ChapterIntro_LoopHOpenText: @ 0x0801F950
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x78
	bl Interpolate
	ldr r2, _0801F9A8 @ =0x03002870
	movs r1, #0x78
	subs r1, r1, r0
	adds r3, r2, #0
	adds r3, #0x2d
	strb r1, [r3]
	adds r3, #4
	movs r1, #0x4e
	strb r1, [r3]
	adds r0, #0x78
	adds r1, r2, #0
	adds r1, #0x2c
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x51
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x52
	ldrh r0, [r0]
	cmp r0, #0
	beq _0801F9AC
	ldrh r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0801F9AC
	adds r0, r1, #2
	strh r0, [r4]
	adds r0, r4, #0
	b _0801F9B6
	.align 2, 0
_0801F9A8: .4byte 0x03002870
_0801F9AC:
	adds r0, r5, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	strh r1, [r0]
_0801F9B6:
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x10
	ble _0801F9C4
	adds r0, r5, #0
	bl Proc_Break
_0801F9C4:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

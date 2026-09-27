	.include "macro.inc"

	.syntax unified

	thumb_func_start PhaseIntroBlendBox_OutLoop
PhaseIntroBlendBox_OutLoop: @ 0x0801E928
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r5, #0x20
	str r5, [sp]
	movs r0, #5
	movs r1, #0
	movs r2, #0x3c
	bl Interpolate
	ldr r3, _0801E9A4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x2d
	movs r1, #0
	strb r1, [r2]
	adds r1, r0, #0
	adds r1, #8
	adds r2, #4
	strb r1, [r2]
	subs r2, #5
	movs r1, #0xf0
	strb r1, [r2]
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0
	ldrsh r3, [r4, r0]
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #7
	bl Interpolate
	ldr r2, _0801E9A8 @ =0x0202BBB8
	adds r1, r2, #0
	adds r1, #0x3a
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x3b
	strb r1, [r2]
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0801E99C
	adds r0, r6, #0
	bl Proc_Break
_0801E99C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0801E9A4: .4byte 0x03002870
_0801E9A8: .4byte 0x0202BBB8

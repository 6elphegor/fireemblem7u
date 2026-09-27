	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPalFade
StartPalFade: @ 0x08013B00
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	mov sb, r0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r1, r3, #0
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	ldr r0, _08013B54 @ =0x0202B5B8
	adds r4, r4, r0
	ldr r0, _08013B58 @ =0x08B92914
	bl Proc_Start
	mov r8, r0
	lsls r5, r5, #5
	ldr r0, _08013B5C @ =0x02022860
	adds r5, r5, r0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0x10
	bl CpuSet
	str r5, [r4, #0x24]
	mov r0, sb
	str r0, [r4, #0x20]
	movs r0, #0
	strh r0, [r4, #0x28]
	strh r6, [r4, #0x2a]
	adds r6, #1
	strh r6, [r4, #0x2c]
	mov r0, r8
	str r4, [r0, #0x2c]
	adds r0, r4, #0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08013B54: .4byte 0x0202B5B8
_08013B58: .4byte 0x08B92914
_08013B5C: .4byte 0x02022860

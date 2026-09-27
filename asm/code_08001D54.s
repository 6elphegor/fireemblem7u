	.include "macro.inc"

	.syntax unified

	thumb_func_start NewKeyStSetter
NewKeyStSetter: @ 0x08001D54
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r1, _08001D88 @ =0x08B857FC
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Start
	str r0, [r7, #4]
	ldr r1, [r7, #4]
	ldr r2, [r7]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x64
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001D88: .4byte 0x08B857FC

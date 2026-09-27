	.include "macro.inc"

	.syntax unified

	thumb_func_start EventLoadUnit
EventLoadUnit: @ 0x08011D34
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov r8, r1
	mov sb, r2
	mov sl, r3
	ldr r7, [sp, #0x24]
	ldr r5, [sp, #0x2c]
	movs r0, #0
	str r0, [sp]
	ldr r4, _08011DA4 @ =0x030041D0
	ldr r2, _08011DA8 @ =0x01000004
	mov r0, sp
	adds r1, r4, #0
	bl CpuFastSet
	movs r0, #3
	ands r5, r0
	lsls r5, r5, #1
	movs r0, #7
	rsbs r0, r0, #0
	ldrb r1, [r4, #3]
	ands r0, r1
	orrs r0, r5
	movs r1, #7
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	strb r0, [r4, #3]
	strb r6, [r4]
	mov r0, r8
	strb r0, [r4, #1]
	mov r1, sb
	strb r1, [r4, #4]
	mov r0, sl
	strb r0, [r4, #5]
	strb r7, [r4, #6]
	add r1, sp, #0x28
	ldrb r1, [r1]
	strb r1, [r4, #7]
	adds r0, r4, #0
	ldr r1, [sp, #0x30]
	bl LoadUnitCore
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011DA4: .4byte 0x030041D0
_08011DA8: .4byte 0x01000004

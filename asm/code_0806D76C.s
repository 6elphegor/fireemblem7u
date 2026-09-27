	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806D76C
sub_0806D76C: @ 0x0806D76C
	push {r4, r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x14]
	str r1, [r7, #4]
	ldr r1, [r7, #4]
	movs r0, #0
	ldr r3, [r7]
	adds r2, r3, #0
	adds r3, #0x64
	ldrh r2, [r3]
	movs r3, #7
	ands r2, r3
	adds r4, r2, #0
	lsls r3, r4, #0x10
	asrs r2, r3, #0x10
	cmp r2, #3
	bgt _0806D796
	movs r0, #1
_0806D796:
	adds r2, r1, #0
	adds r1, #0x40
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	ldr r0, [r7]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x64
	ldrh r3, [r2]
	subs r1, r3, #1
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x64
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _0806D7FA
	ldr r0, [r7]
	bl Proc_Break
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r0, #0x40
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806D7FA:
	add sp, #8
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

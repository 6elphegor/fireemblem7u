	.include "macro.inc"

	.syntax unified

	thumb_func_start SetMuMoveScript
SetMuMoveScript: @ 0x0806C104
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	movs r0, #0
	str r0, [r7, #8]
_0806C112:
	ldr r0, [r7, #8]
	cmp r0, #0x3f
	ble _0806C11A
	b _0806C144
_0806C11A:
	ldr r0, [r7]
	ldr r1, [r0, #0x34]
	adds r0, r1, #5
	ldr r1, [r7, #8]
	adds r0, r0, r1
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r1, r1, r2
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #8]
	adds r1, r0, #1
	str r1, [r7, #8]
	b _0806C112
_0806C144:
	ldr r1, [r7]
	ldr r0, [r1, #0x34]
	ldrb r1, [r0, #4]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0, #4]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #2
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	bl PlayMuStepSe
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0

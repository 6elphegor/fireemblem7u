	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitMu
GetUnitMu: @ 0x0806E2B8
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
_0806E2C4:
	ldr r0, [r7, #4]
	cmp r0, #3
	ble _0806E2CC
	b _0806E2EE
_0806E2CC:
	ldr r1, [r7, #4]
	adds r0, r1, #0
	bl sub_0806E278
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	ldr r1, [r0, #0x2c]
	ldr r0, [r7]
	cmp r1, r0
	bne _0806E2E6
	ldr r1, [r7, #8]
	adds r0, r1, #0
	b _0806E2F2
_0806E2E6:
	ldr r0, [r7, #4]
	adds r1, r0, #1
	str r1, [r7, #4]
	b _0806E2C4
_0806E2EE:
	movs r0, #0
	b _0806E2F2
_0806E2F2:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start CanStartMu
CanStartMu: @ 0x0806CE00
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806CE0A:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806CE12
	b _0806CE34
_0806CE12:
	ldr r0, _0806CE28 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806CE2C
	movs r0, #1
	b _0806CE38
	.align 2, 0
_0806CE28: .4byte 0x030014E8
_0806CE2C:
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806CE0A
_0806CE34:
	movs r0, #0
	b _0806CE38
_0806CE38:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

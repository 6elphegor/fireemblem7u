	.include "macro.inc"

	.syntax unified

	thumb_func_start MU_Init
MU_Init: @ 0x0806BA4C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	movs r0, #0
	str r0, [r7]
_0806BA56:
	ldr r0, [r7]
	cmp r0, #3
	ble _0806BA5E
	b _0806BA80
_0806BA5E:
	ldr r0, _0806BA7C @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #1
	str r1, [r7]
	b _0806BA56
	.align 2, 0
_0806BA7C: .4byte 0x030014E8
_0806BA80:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

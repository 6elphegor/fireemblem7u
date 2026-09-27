	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E278
sub_0806E278: @ 0x0806E278
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806E294 @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, r0, r1
	ldrb r1, [r0]
	cmp r1, #0
	bne _0806E298
	movs r0, #0
	b _0806E2B0
	.align 2, 0
_0806E294: .4byte 0x030014E8
_0806E298:
	ldr r0, _0806E2AC @ =0x030014E8
	ldr r1, [r7]
	movs r2, #0x4c
	muls r1, r2, r1
	adds r0, #0x48
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	b _0806E2B0
	.align 2, 0
_0806E2AC: .4byte 0x030014E8
_0806E2B0:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

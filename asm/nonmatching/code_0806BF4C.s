	.include "macro.inc"

	.syntax unified

	thumb_func_start SetMuFacing
SetMuFacing: @ 0x0806BF4C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	ldr r2, [r7, #4]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strb r2, [r1]
	ldr r0, [r7, #4]
	cmp r0, #0xf
	bne _0806BF88
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	ldr r1, [r7]
	ldr r2, [r1, #0x38]
	adds r1, r2, #0
	bl SetStandingMuFacing
	b _0806BF9A
_0806BF88:
	ldr r1, [r7]
	ldr r0, [r1, #0x30]
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl SetSpriteAnimId
_0806BF9A:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

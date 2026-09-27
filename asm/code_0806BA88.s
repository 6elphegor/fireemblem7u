	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806BA88
sub_0806BA88: @ 0x0806BA88
	push {r4, r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	adds r0, r1, #0
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	ldr r1, [r7]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r3, [r7, #4]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	movs r3, #1
	rsbs r3, r3, #0
	ldr r4, [r7, #8]
	str r4, [sp]
	bl StartMuInternal
	str r0, [r7, #0xc]
	ldr r0, [r7, #0xc]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #0xc]
	adds r1, r0, #0
	adds r0, #0x3e
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7, #0xc]
	adds r0, r1, #0
	b _0806BAE6
_0806BAE6:
	add sp, #0x14
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

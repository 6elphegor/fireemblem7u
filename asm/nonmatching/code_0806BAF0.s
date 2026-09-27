	.include "macro.inc"

	.syntax unified

	thumb_func_start StartMu
StartMu: @ 0x0806BAF0
	push {r4, r7, lr}
	sub sp, #0x10
	add r7, sp, #4
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #4]
	ldrb r0, [r1, #4]
	str r0, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r0, #0xc]
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r1, #0
	ands r0, r2
	cmp r0, #0
	beq _0806BB44
	ldr r0, [r7]
	ldrb r1, [r0, #0x1c]
	adds r0, r1, #0
	bl GetTrap
	adds r1, r0, #0
	ldrb r0, [r1, #3]
	cmp r0, #0x35
	beq _0806BB38
	cmp r0, #0x35
	bgt _0806BB2C
	cmp r0, #0x34
	beq _0806BB32
	b _0806BB44
_0806BB2C:
	cmp r0, #0x36
	beq _0806BB3E
	b _0806BB44
_0806BB32:
	movs r0, #0x5b
	str r0, [r7, #8]
	b _0806BB44
_0806BB38:
	movs r0, #0x5c
	str r0, [r7, #8]
	b _0806BB44
_0806BB3E:
	movs r0, #0x5d
	str r0, [r7, #8]
	b _0806BB44
_0806BB44:
	ldr r0, [r7]
	bl GetUnitSpritePalette
	ldr r1, [r7]
	movs r2, #0x10
	ldrsb r2, [r1, r2]
	adds r1, r2, #0
	lsls r2, r1, #0x10
	lsrs r1, r2, #0x10
	ldr r2, [r7]
	movs r3, #0x11
	ldrsb r3, [r2, r3]
	adds r2, r3, #0
	lsls r3, r2, #0x10
	lsrs r2, r3, #0x10
	ldr r4, [r7, #8]
	adds r3, r4, #0
	lsls r4, r3, #0x10
	lsrs r3, r4, #0x10
	movs r4, #1
	rsbs r4, r4, #0
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r2, #0
	adds r2, r3, #0
	adds r3, r4, #0
	bl StartMuInternal
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
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
	ldr r1, [r7, #4]
	adds r0, r1, #0
	b _0806BBA2
_0806BBA2:
	add sp, #0x10
	pop {r4, r7}
	pop {r1}
	bx r1
	.align 2, 0

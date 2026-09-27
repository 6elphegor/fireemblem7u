	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E7C4
sub_0806E7C4: @ 0x0806E7C4
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #8]
	ldr r1, _0806E7E4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E7FC
	cmp r0, #2
	beq _0806E7E8
	b _0806E818
	.align 2, 0
_0806E7E4: .4byte 0x0203E0FC
_0806E7E8:
	ldr r0, _0806E814 @ =0x0203E0FC
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806E7FC
	movs r0, #1
	str r0, [r7, #8]
_0806E7FC:
	ldr r0, _0806E814 @ =0x0203E0FC
	ldr r1, [r0, #4]
	adds r0, r1, #0
	adds r1, #0x6e
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0806E810
	movs r0, #0
	str r0, [r7, #8]
_0806E810:
	b _0806E818
	.align 2, 0
_0806E814: .4byte 0x0203E0FC
_0806E818:
	ldr r0, [r7, #8]
	cmp r0, #0
	blt _0806E8C8
	ldr r1, _0806E8D0 @ =0x08C9D820
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	ldr r1, _0806E8D4 @ =0x0203E0FC
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x64
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7, #4]
	ldr r1, _0806E8D4 @ =0x0203E0FC
	ldr r2, [r7, #8]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x71
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	ldr r2, _0806E8D4 @ =0x0203E0FC
	ldr r3, [r7, #8]
	adds r5, r3, #0
	lsls r4, r5, #2
	adds r4, r4, r3
	lsls r3, r4, #2
	adds r2, #4
	adds r3, r2, r3
	ldr r4, [r3]
	adds r2, r4, #0
	adds r3, r4, #0
	adds r3, #0x6e
	movs r4, #0
	ldrsb r4, [r3, r4]
	adds r2, r4, #0
	adds r1, r1, r2
	adds r2, r0, #0
	adds r0, #0x66
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r1, [r7, #4]
	ldr r2, [r7, #8]
	adds r0, r2, #0
	adds r2, r1, #0
	adds r1, #0x68
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r0, r3
	adds r2, r0, #0
	strh r2, [r1]
_0806E8C8:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E8D0: .4byte 0x08C9D820
_0806E8D4: .4byte 0x0203E0FC

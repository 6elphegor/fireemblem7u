	.include "macro.inc"

	.syntax unified

	thumb_func_start InitManimActor
InitManimActor: @ 0x0806EB44
	push {r4, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7, #4]
	cmp r0, #0
	bne _0806EB58
	b _0806EC0C
_0806EB58:
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #8]
	str r1, [r0]
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r0, [r7, #4]
	str r0, [r1]
	ldr r1, [r7, #8]
	adds r0, r1, #0
	bl StartMu
	ldr r1, _0806EBF0 @ =0x0203E0FC
	ldr r2, [r7]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #8
	adds r2, r1, r2
	str r0, [r2]
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x18]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x18]
	ldr r0, _0806EBF0 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	ldr r0, [r2, #0x30]
	ldrh r1, [r0, #0x1a]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strh r2, [r0, #0x1a]
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x1b
	beq _0806EBF4
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x55
	ldrb r0, [r1]
	cmp r0, #0x33
	beq _0806EBF4
	b _0806EC0C
	.align 2, 0
_0806EBF0: .4byte 0x0203E0FC
_0806EBF4:
	ldr r0, _0806EC14 @ =0x0203E0FC
	ldr r1, [r7]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl HideMu
_0806EC0C:
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806EC14: .4byte 0x0203E0FC

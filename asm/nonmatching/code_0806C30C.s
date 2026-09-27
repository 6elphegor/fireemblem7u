	.include "macro.inc"

	.syntax unified

	thumb_func_start RunMuMoveScript
RunMuMoveScript: @ 0x0806C30C
	push {r4, r5, r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
_0806C314:
	b _0806C318
_0806C316:
	.byte 0x0E, 0xE1
_0806C318:
	adds r0, r7, #4
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r1, #0
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldrh r1, [r0]
	adds r0, r1, #1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	asrs r0, r1, #0x10
	cmp r0, #0xf
	bls _0806C34C
	b _0806C532
_0806C34C:
	lsls r1, r0, #2
	ldr r2, _0806C358 @ =_0806C35C
	adds r0, r1, r2
	ldr r1, [r0]
	mov pc, r1
	.align 2, 0
_0806C358: .4byte _0806C35C
_0806C35C: @ jump table
	.4byte _0806C44C @ case 0
	.4byte _0806C45A @ case 1
	.4byte _0806C45A @ case 2
	.4byte _0806C45A @ case 3
	.4byte _0806C45A @ case 4
	.4byte _0806C444 @ case 5
	.4byte _0806C4AA @ case 6
	.4byte _0806C4AA @ case 7
	.4byte _0806C4AA @ case 8
	.4byte _0806C4AA @ case 9
	.4byte _0806C39C @ case 10
	.4byte _0806C3E8 @ case 11
	.4byte _0806C532 @ case 12
	.4byte _0806C4EE @ case 13
	.4byte _0806C522 @ case 14
	.4byte _0806C52A @ case 15
_0806C39C:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x48
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	b _0806C536
_0806C3E8:
	ldr r0, [r7]
	bl EndMuMovement
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #5
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4c
	movs r2, #0
	ldrsh r0, [r1, r2]
	asrs r1, r0, #4
	adds r0, r1, #0
	lsls r1, r0, #0x10
	asrs r0, r1, #0x10
	ldr r1, _0806C440 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r0, r0, r2
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x4e
	movs r4, #0
	ldrsh r1, [r2, r4]
	asrs r2, r1, #4
	adds r1, r2, #0
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	ldr r2, _0806C440 @ =0x0202BBB8
	movs r4, #0xe
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl StartMuFogBump
	b _0806C536
	.align 2, 0
_0806C440: .4byte 0x0202BBB8
_0806C444:
	ldr r0, [r7]
	bl HaltMu
	b _0806C536
_0806C44C:
	ldr r0, [r7]
	bl EndMuMovement
	ldr r0, [r7]
	bl EndMu
	b _0806C536
_0806C45A:
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806C4A8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetMuAnimForJid
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r3, #0
	ldrsh r1, [r0, r3]
	ldr r0, [r7]
	bl SetMuFacing
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
_0806C4A8:
	b _0806C536
_0806C4AA:
	adds r0, r7, #4
	adds r1, r7, #4
	ldrh r2, [r1]
	subs r1, r2, #5
	adds r2, r1, #0
	strh r2, [r0]
	adds r0, r7, #4
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x42
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	movs r4, #0
	ldrsh r0, [r0, r4]
	lsls r2, r1, #0x10
	asrs r1, r2, #0x10
	cmp r0, r1
	beq _0806C4EC
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetMuAnimForJid
	str r0, [r7, #8]
	adds r0, r7, #4
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r0, [r7]
	bl SetMuFacing
_0806C4EC:
	b _0806C314
_0806C4EE:
	ldr r0, [r7]
	ldr r2, [r7]
	ldr r1, [r2, #0x34]
	ldr r3, [r7]
	ldr r2, [r3, #0x34]
	ldrb r3, [r2, #4]
	adds r4, r3, #1
	adds r5, r4, #0
	strb r5, [r2, #4]
	lsls r3, r3, #0x18
	lsrs r2, r3, #0x18
	adds r1, #5
	adds r2, r1, r2
	movs r3, #0
	ldrsb r3, [r2, r3]
	adds r1, r3, #0
	adds r2, r0, #0
	adds r0, #0x4a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strh r2, [r0]
	b _0806C314
_0806C522:
	ldr r0, [r7]
	bl EnableMuCamera
	b _0806C314
_0806C52A:
	ldr r0, [r7]
	bl DisableMuCamera
	b _0806C314
_0806C532:
	b _0806C534
_0806C534:
	b _0806C314
_0806C536:
	add sp, #0xc
	pop {r4, r5, r7}
	pop {r0}
	bx r0
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepMuralBackground_Init
PrepMuralBackground_Init: @ 0x080905D4
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08090684 @ =0x02024460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	movs r0, #0
	strh r0, [r6, #0x2a]
	movs r7, #0
	mov sl, r4
	movs r0, #0x2d
	adds r0, r0, r6
	mov sb, r0
	adds r1, r6, #0
	adds r1, #0x2c
	str r1, [sp]
_08090600:
	movs r5, #0
	adds r3, r7, #1
	mov r8, r3
_08090606:
	ldrh r0, [r6, #0x2a]
	lsrs r4, r0, #3
	adds r4, r7, r4
	adds r0, r4, #0
	movs r1, #0x28
	bl __modsi3
	movs r1, #0x27
	subs r1, r1, r0
	movs r0, #0x1f
	ands r4, r0
	lsls r4, r4, #6
	lsls r2, r5, #1
	adds r4, r4, r2
	add r4, sl
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08090688 @ =0x0840C7CE
	adds r0, r0, r1
	adds r2, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	lsls r0, r3, #0xc
	ldrh r2, [r2]
	adds r0, r2, r0
	strh r0, [r4]
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0x1d
	bls _08090606
	mov r1, r8
	lsls r0, r1, #0x10
	lsrs r7, r0, #0x10
	cmp r7, #0x1f
	bls _08090600
	movs r0, #8
	bl EnableBgSync
	movs r0, #0
	ldr r3, [sp]
	strb r0, [r3]
	movs r4, #0xff
	adds r2, r4, #0
	ldrh r0, [r6, #0x2a]
	ands r2, r0
	movs r0, #3
	movs r1, #0
	bl SetBgOffset
	ldr r0, _0809068C @ =0x0400001E
	ldrh r6, [r6, #0x2a]
	ands r4, r6
	strh r4, [r0]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08090684: .4byte 0x02024460
_08090688: .4byte 0x0840C7CE
_0809068C: .4byte 0x0400001E

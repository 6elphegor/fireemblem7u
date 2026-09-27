	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragon_WaitMainBodyFallIn
EkrDragon_WaitMainBodyFallIn: @ 0x08065108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08065128 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #2
	bne _0806512C
	adds r0, r5, #0
	bl Proc_Break
	b _0806529C
	.align 2, 0
_08065128: .4byte 0x0203E02C
_0806512C:
	movs r0, #0x3a
	ldrsh r1, [r5, r0]
	movs r3, #0x3c
	ldrsh r2, [r5, r3]
	movs r4, #0x2c
	ldrsh r3, [r5, r4]
	movs r6, #0x2e
	ldrsh r0, [r5, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r7, r0, #0
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r7
	strh r0, [r1, #0x3a]
	ldr r1, [r5, #0x64]
	ldr r4, _080652AC @ =0x02017760
	ldrh r2, [r1, #0x32]
	ldrh r3, [r4]
	subs r0, r2, r3
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldrh r6, [r1, #0x3a]
	ldrh r2, [r4, #2]
	subs r0, r6, r2
	strh r0, [r1, #0x3a]
	ldr r3, _080652B0 @ =0x02000028
	mov sl, r3
	ldrh r6, [r3, #2]
	ldrh r0, [r4]
	adds r1, r6, r0
	ldr r2, _080652B4 @ =0x0201FB00
	mov r8, r2
	ldr r0, [r2]
	subs r1, r1, r0
	ldr r3, _080652B8 @ =0x0200002C
	mov sb, r3
	ldrh r6, [r3, #2]
	ldrh r0, [r4, #2]
	subs r2, r6, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	movs r2, #0
	ldrsh r1, [r4, r2]
	mov r3, r8
	ldr r0, [r3]
	adds r0, r0, r1
	movs r6, #2
	ldrsh r1, [r4, r6]
	adds r1, r7, r1
	bl EkrDragonTmCpyExt
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _080652BC @ =0x02000038
	ldrh r0, [r4]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r4, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r4]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	ldrh r2, [r6, #2]
	adds r1, r4, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r5, #0x2c]
	adds r1, #1
	strh r1, [r5, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0x2e
	ldrsh r0, [r5, r3]
	adds r0, #1
	cmp r1, r0
	bne _0806529C
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #2]
	strh r0, [r1, #0x32]
	ldr r1, [r5, #0x64]
	ldr r0, [r5, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r7
	strh r0, [r1, #0x3a]
	mov r4, r8
	ldr r1, [r4]
	mov r0, sl
	ldrh r0, [r0, #2]
	subs r1, r0, r1
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r3, sb
	movs r4, #2
	ldrsh r2, [r3, r4]
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r1, r8
	ldr r0, [r1]
	adds r1, r7, #0
	bl EkrDragonTmCpyExt
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r2, [r6]
	rsbs r0, r2, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r6, #2]
	rsbs r1, r3, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r4, [r6]
	rsbs r0, r4, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldr r0, [r5, #0x54]
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_0806529C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080652AC: .4byte 0x02017760
_080652B0: .4byte 0x02000028
_080652B4: .4byte 0x0201FB00
_080652B8: .4byte 0x0200002C
_080652BC: .4byte 0x02000038

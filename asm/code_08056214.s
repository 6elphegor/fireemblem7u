	.include "macro.inc"

	.syntax unified

	thumb_func_start Loop6C_efxMagicQUAKE
Loop6C_efxMagicQUAKE: @ 0x08056214
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	ldr r5, _080562A4 @ =0x02017760
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r4, _080562A8 @ =0x02000038
	ldrh r0, [r5]
	ldrh r2, [r4]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r4, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r4]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r4, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r5]
	ldrh r1, [r4]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r4, [r4, #2]
	adds r1, r2, r4
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08056292
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #3
	bl SetBgOffset
_08056292:
	bl CheckInEkrDragon
	cmp r0, #0
	beq _080562B0
	ldr r3, _080562AC @ =0x02000028
	ldrh r4, [r3]
	ldrh r1, [r5]
	subs r0, r4, r1
	b _080562B8
	.align 2, 0
_080562A4: .4byte 0x02017760
_080562A8: .4byte 0x02000038
_080562AC: .4byte 0x02000028
_080562B0:
	ldr r3, _080563C8 @ =0x02000028
	ldrh r1, [r3]
	ldrh r2, [r5]
	adds r0, r1, r2
_080562B8:
	ldr r2, _080563CC @ =0x0201FB00
	ldr r1, [r2]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	ldr r1, _080563D0 @ =0x0200002C
	ldrh r4, [r1]
	ldrh r5, [r5, #2]
	subs r0, r4, r5
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov sb, r3
	mov sl, r1
	ldr r2, _080563D4 @ =0x02017760
	mov r1, sb
	ldrh r1, [r1, #2]
	ldrh r3, [r2]
	adds r0, r1, r3
	ldr r4, _080563CC @ =0x0201FB00
	ldr r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r1, sl
	ldrh r1, [r1, #2]
	ldrh r2, [r2, #2]
	subs r0, r1, r2
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	lsls r1, r7, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r2, r8
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	ldrh r3, [r2, #0x2e]
	lsls r1, r3, #0x10
	cmp r0, r1
	ble _080563BA
	ldr r1, _080563D8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r4, _080563DC @ =0x02000038
	ldrh r1, [r4]
	ldrh r2, [r4, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r4]
	rsbs r0, r1, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r4, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r4]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r4, [r4, #2]
	rsbs r1, r4, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	bl CheckInEkrDragon
	cmp r0, #0
	beq _08056378
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
_08056378:
	ldr r4, _080563CC @ =0x0201FB00
	ldr r0, [r4]
	mov r2, sb
	ldrh r2, [r2]
	subs r1, r2, r0
	mov r3, sb
	ldrh r3, [r3, #2]
	subs r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	mov r0, sl
	ldrh r4, [r0, #2]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r0, r3]
	movs r0, #0
	bl SetEkrFrontAnimPostion
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r4, #0x10
	asrs r2, r2, #0x10
	movs r0, #1
	bl SetEkrFrontAnimPostion
	mov r4, r8
	ldr r0, [r4, #0x60]
	bl Proc_End
	mov r0, r8
	bl Proc_Break
_080563BA:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080563C8: .4byte 0x02000028
_080563CC: .4byte 0x0201FB00
_080563D0: .4byte 0x0200002C
_080563D4: .4byte 0x02017760
_080563D8: .4byte 0x0201774C
_080563DC: .4byte 0x02000038

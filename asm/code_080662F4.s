	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonTunk_Loop2
EkrDragonTunk_Loop2: @ 0x080662F4
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0x3a
	ldrsh r1, [r4, r0]
	movs r3, #0x3c
	ldrsh r2, [r4, r3]
	movs r5, #0x2c
	ldrsh r3, [r4, r5]
	movs r6, #0x2e
	ldrsh r0, [r4, r6]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r1, r0, #0
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #2]
	subs r0, #0x16
	movs r7, #0
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldr r0, [r4, #0x5c]
	ldrh r0, [r0, #4]
	subs r0, r0, r1
	adds r0, #0xd8
	strh r0, [r2, #0x3a]
	ldr r2, [r4, #0x64]
	ldr r5, _080664B0 @ =0x02017760
	ldrh r3, [r2, #0x32]
	ldrh r6, [r5]
	subs r0, r3, r6
	strh r0, [r2, #0x32]
	ldr r2, [r4, #0x64]
	ldrh r3, [r2, #0x3a]
	ldrh r6, [r5, #2]
	subs r0, r3, r6
	strh r0, [r2, #0x3a]
	movs r2, #0
	ldrsh r0, [r5, r2]
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r1, r1, r2
	bl sub_08066164
	ldrh r1, [r5]
	ldrh r2, [r5, #2]
	movs r0, #2
	bl SetBgOffset
	ldr r6, _080664B4 @ =0x02000038
	ldrh r0, [r5]
	ldrh r2, [r6]
	adds r1, r0, r2
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldrh r3, [r5, #2]
	ldrh r0, [r6, #2]
	adds r2, r3, r0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #0
	bl SetBgOffset
	ldrh r1, [r5]
	ldrh r2, [r6]
	adds r0, r1, r2
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r3, [r5, #2]
	ldrh r2, [r6, #2]
	adds r1, r3, r2
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r5]
	ldrh r1, [r6]
	adds r0, r3, r1
	rsbs r0, r0, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r2, [r5, #2]
	ldrh r3, [r6, #2]
	adds r1, r2, r3
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	ldrh r1, [r4, #0x2c]
	adds r1, #1
	strh r1, [r4, #0x2c]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	adds r0, #1
	cmp r1, r0
	bne _080663C6
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
_080663C6:
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080663EC
	movs r0, #8
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
	ldr r0, _080664B8 @ =0x000002F3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_080663EC:
	ldrh r3, [r4, #0x30]
	cmp r3, #0x3c
	bne _08066402
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #9
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
_08066402:
	ldrh r0, [r4, #0x30]
	cmp r0, #0x5a
	bne _08066418
	ldr r0, [r4, #0x54]
	bl Proc_End
	movs r0, #0xa
	movs r1, #0
	bl NewEfxQuakePure
	str r0, [r4, #0x54]
_08066418:
	ldrh r1, [r4, #0x30]
	cmp r1, #0x87
	bne _08066428
	movs r0, #0x3c
	movs r1, #0x1e
	movs r2, #0x78
	bl NewEkrDragonScreenFlashing
_08066428:
	ldrh r2, [r4, #0x30]
	cmp r2, #0xc8
	bne _0806648E
	ldrh r0, [r4, #0x2e]
	strh r0, [r4, #0x2c]
	ldr r0, [r4, #0x64]
	bl Proc_End
	ldr r0, [r4, #0x54]
	bl Proc_End
	strh r7, [r5]
	strh r7, [r5, #2]
	movs r3, #0x3c
	ldrsh r1, [r4, r3]
	movs r0, #0
	bl sub_08066164
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldrh r1, [r6]
	ldrh r2, [r6, #2]
	movs r0, #0
	bl SetBgOffset
	ldrh r5, [r6]
	rsbs r0, r5, #0
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	ldrh r2, [r6, #2]
	rsbs r1, r2, #0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_0804CC8C
	ldrh r3, [r6]
	rsbs r0, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r6, [r6, #2]
	rsbs r1, r6, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl EkrDispUP_SetPositionSync
	movs r0, #0x10
	bl EkrDragonUpdatePal_08065510
_0806648E:
	movs r0, #0xc8
	lsls r0, r0, #1
	ldrh r5, [r4, #0x30]
	cmp r5, r0
	bne _080664A6
	adds r1, r4, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080664A6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080664B0: .4byte 0x02017760
_080664B4: .4byte 0x02000038
_080664B8: .4byte 0x000002F3

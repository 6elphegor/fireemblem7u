	.include "macro.inc"

	.syntax unified

	thumb_func_start efxRestRSTMain
efxRestRSTMain: @ 0x08055910
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r2, r0, #0
	ldr r0, _08055990 @ =0x0201FDAC
	ldr r0, [r0]
	ldr r4, _08055994 @ =0x0201FDB8
	cmp r0, #0
	bne _08055928
	ldr r4, _08055998 @ =0x0201FEF8
_08055928:
	ldrh r0, [r2, #0x2e]
	lsls r1, r0, #0x18
	lsrs r3, r1, #0x18
	ldr r1, [r2, #0x50]
	adds r0, r0, r1
	strh r0, [r2, #0x2e]
	movs r1, #0
	ldr r0, [r2, #0x44]
	mov r8, r0
	ldr r6, [r2, #0x48]
	mov sl, r6
	ldr r7, _0805599C @ =0x08BDACBC
	mov ip, r7
	ldr r5, [r2, #0x4c]
	ldr r0, _080559A0 @ =0x03002870
	mov sb, r0
_08055948:
	mov r6, sl
	adds r0, r3, r6
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	lsls r0, r3, #1
	add r0, ip
	movs r7, #0
	ldrsh r0, [r0, r7]
	muls r0, r5, r0
	lsls r0, r0, #8
	lsrs r0, r0, #0x10
	mov r6, sb
	ldrh r6, [r6, #0x20]
	adds r0, r6, r0
	strh r0, [r4]
	adds r4, #2
	adds r1, #1
	cmp r1, #0x77
	bls _08055948
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, r8
	bne _08055982
	adds r0, r2, #0
	bl Proc_End
_08055982:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055990: .4byte 0x0201FDAC
_08055994: .4byte 0x0201FDB8
_08055998: .4byte 0x0201FEF8
_0805599C: .4byte 0x08BDACBC
_080559A0: .4byte 0x03002870

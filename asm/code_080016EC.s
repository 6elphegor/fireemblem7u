	.include "macro.inc"

	.syntax unified

	thumb_func_start SyncBgsAndPal
SyncBgsAndPal: @ 0x080016EC
	push {r7, lr}
	mov r7, sp
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001712
	ldr r0, _080017B0 @ =0x02022C60
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001712:
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #2
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001734
	ldr r0, _080017B8 @ =0x02023460
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2, #4]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001734:
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #4
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001756
	ldr r0, _080017BC @ =0x02023C60
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2, #8]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001756:
	ldr r0, _080017AC @ =0x0300000C
	ldrb r1, [r0]
	movs r2, #8
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08001778
	ldr r0, _080017C0 @ =0x02024460
	ldr r2, _080017B4 @ =0x02024C60
	ldr r1, [r2, #0xc]
	movs r2, #0x80
	lsls r2, r2, #2
	bl CpuFastSet
_08001778:
	ldr r0, _080017AC @ =0x0300000C
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080017C4 @ =0x0300000D
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #1
	bne _08001804
	ldr r0, _080017C4 @ =0x0300000D
	movs r1, #0
	strb r1, [r0]
	ldr r1, _080017C8 @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _080017D0
	ldr r0, _080017CC @ =0x02022860
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	b _08001804
	.align 2, 0
_080017AC: .4byte 0x0300000C
_080017B0: .4byte 0x02022C60
_080017B4: .4byte 0x02024C60
_080017B8: .4byte 0x02023460
_080017BC: .4byte 0x02023C60
_080017C0: .4byte 0x02024460
_080017C4: .4byte 0x0300000D
_080017C8: .4byte 0x03002870
_080017CC: .4byte 0x02022860
_080017D0:
	ldr r1, _080017F0 @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _080017F4
	ldr r1, _080017F0 @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl ApplyColorAddition_ClampMax
	b _08001804
	.align 2, 0
_080017F0: .4byte 0x03002870
_080017F4:
	ldr r1, _0800180C @ =0x03002870
	adds r0, r1, #0
	adds r1, #0x68
	movs r2, #0
	ldrsb r2, [r1, r2]
	adds r0, r2, #0
	bl ApplyColorAddition_ClampMin
_08001804:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800180C: .4byte 0x03002870

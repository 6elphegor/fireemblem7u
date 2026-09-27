	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxMantBatabata
NewEfxMantBatabata: @ 0x080637D4
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r7, r0, #0
	bl GetAnimPosition
	ldr r1, _08063800 @ =0x0203E08E
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x57
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1b
	bhi _080638C8
	lsls r0, r0, #2
	ldr r1, _08063804 @ =_08063808
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08063800: .4byte 0x0203E08E
_08063804: .4byte _08063808
_08063808: @ jump table
	.4byte _08063878 @ case 0
	.4byte _08063878 @ case 1
	.4byte _08063888 @ case 2
	.4byte _080638C8 @ case 3
	.4byte _08063888 @ case 4
	.4byte _080638C8 @ case 5
	.4byte _080638C8 @ case 6
	.4byte _080638C8 @ case 7
	.4byte _080638C8 @ case 8
	.4byte _080638C8 @ case 9
	.4byte _080638C8 @ case 10
	.4byte _080638C8 @ case 11
	.4byte _080638C8 @ case 12
	.4byte _080638C8 @ case 13
	.4byte _080638C8 @ case 14
	.4byte _080638C8 @ case 15
	.4byte _080638C8 @ case 16
	.4byte _08063898 @ case 17
	.4byte _080638C8 @ case 18
	.4byte _080638C8 @ case 19
	.4byte _080638B8 @ case 20
	.4byte _080638B8 @ case 21
	.4byte _080638C8 @ case 22
	.4byte _080638C8 @ case 23
	.4byte _080638C8 @ case 24
	.4byte _080638C8 @ case 25
	.4byte _080638A8 @ case 26
	.4byte _080638A8 @ case 27
_08063878:
	ldr r5, _08063880 @ =0x08BB17E8
	ldr r4, _08063884 @ =0x08BB197C
	b _080638CC
	.align 2, 0
_08063880: .4byte 0x08BB17E8
_08063884: .4byte 0x08BB197C
_08063888:
	ldr r5, _08063890 @ =0x08BB1B28
	ldr r4, _08063894 @ =0x08BB1CD4
	b _080638CC
	.align 2, 0
_08063890: .4byte 0x08BB1B28
_08063894: .4byte 0x08BB1CD4
_08063898:
	ldr r5, _080638A0 @ =0x08BB1E80
	ldr r4, _080638A4 @ =0x08BB2028
	b _080638CC
	.align 2, 0
_080638A0: .4byte 0x08BB1E80
_080638A4: .4byte 0x08BB2028
_080638A8:
	ldr r5, _080638B0 @ =0x08BB2164
	ldr r4, _080638B4 @ =0x08BB229C
	b _080638CC
	.align 2, 0
_080638B0: .4byte 0x08BB2164
_080638B4: .4byte 0x08BB229C
_080638B8:
	ldr r5, _080638C0 @ =0x08BB2500
	ldr r4, _080638C4 @ =0x08BB2768
	b _080638CC
	.align 2, 0
_080638C0: .4byte 0x08BB2500
_080638C4: .4byte 0x08BB2768
_080638C8:
	ldr r5, _08063924 @ =0x08BB288C
	ldr r4, _08063928 @ =0x08BB29B0
_080638CC:
	ldr r0, _0806392C @ =0x08BA466C
	movs r1, #3
	bl Proc_Start
	adds r6, r0, #0
	str r7, [r6, #0x5c]
	movs r0, #0
	mov r8, r0
	movs r0, #0
	strh r0, [r6, #0x2c]
	str r5, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl EfxCreateFrontAnim
	adds r4, r0, #0
	str r4, [r6, #0x60]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	ldr r1, _08063930 @ =0x02000010
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r6, #0x60]
	str r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	ldrh r1, [r4, #8]
	ands r0, r1
	strh r0, [r4, #8]
	movs r0, #0x64
	strh r0, [r4, #0xa]
	bl AnimSort
	adds r0, r7, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063934
	movs r1, #0xe4
	lsls r1, r1, #7
	b _08063938
	.align 2, 0
_08063924: .4byte 0x08BB288C
_08063928: .4byte 0x08BB29B0
_0806392C: .4byte 0x08BA466C
_08063930: .4byte 0x02000010
_08063934:
	movs r1, #0x93
	lsls r1, r1, #8
_08063938:
	adds r0, r1, #0
	ldrh r1, [r4, #8]
	orrs r0, r1
	strh r0, [r4, #8]
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	bl SetAnimStateHidden
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

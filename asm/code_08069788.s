	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08069788
sub_08069788: @ 0x08069788
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r5, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x14
	bne _0806985E
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldrh r0, [r5, #0x2e]
	cmp r0, #8
	beq _08069864
	ldr r7, _08069834 @ =0x0202010C
_080697AC:
	movs r1, #0x2e
	ldrsh r0, [r5, r1]
	lsls r0, r0, #1
	adds r2, r0, r7
	ldr r1, _08069838 @ =0x0202011C
	adds r0, r0, r1
	ldrh r0, [r0]
	ldrh r1, [r2]
	subs r6, r0, r1
	cmp r6, #0
	beq _08069850
	movs r1, #0
	mov r8, r1
	strh r0, [r2]
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	adds r0, r5, #0
	bl sub_08068EC0
	ldr r4, _0806983C @ =0x00000396
	adds r0, r4, #0
	movs r1, #0x80
	lsls r1, r1, #1
	bl EfxPlaySE
	adds r0, r4, #0
	movs r1, #0x38
	movs r2, #0
	bl M4aPlayWithPostionCtrl
	ldr r1, _08069840 @ =0x082E5BF0
	movs r0, #0x2e
	ldrsh r4, [r5, r0]
	lsls r0, r4, #1
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r2, #0x1f
	ands r2, r3
	lsls r2, r2, #3
	adds r2, #0x35
	movs r1, #0xfc
	lsls r1, r1, #3
	adds r0, r1, #0
	ands r3, r0
	lsrs r3, r3, #2
	adds r3, #6
	adds r4, #1
	str r4, [sp]
	str r6, [sp, #4]
	movs r0, #0xa0
	movs r1, #1
	bl BanimDrawStatupAp
	movs r2, #0x2e
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bne _0806982E
	ldr r1, _08069844 @ =0x0203E0BC
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r0, [r0]
	strh r0, [r1, #2]
	ldr r1, _08069848 @ =0x0203E0C0
	ldr r0, _0806984C @ =0x0000FFFF
	strh r0, [r1, #2]
_0806982E:
	mov r0, r8
	strh r0, [r5, #0x2c]
	b _0806985E
	.align 2, 0
_08069834: .4byte 0x0202010C
_08069838: .4byte 0x0202011C
_0806983C: .4byte 0x00000396
_08069840: .4byte 0x082E5BF0
_08069844: .4byte 0x0203E0BC
_08069848: .4byte 0x0203E0C0
_0806984C: .4byte 0x0000FFFF
_08069850:
	ldrh r0, [r5, #0x2e]
	adds r0, #1
	strh r0, [r5, #0x2e]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #8
	bne _080697AC
_0806985E:
	ldrh r1, [r5, #0x2e]
	cmp r1, #8
	bne _0806986E
_08069864:
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl Proc_Break
_0806986E:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080ACBC8
sub_080ACBC8: @ 0x080ACBC8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	movs r0, #0
	mov r8, r0
	mov r0, sp
	mov r1, r8
	strh r1, [r0]
	ldr r0, _080ACC34 @ =0x08CE577C
	ldr r1, [r0]
	ldr r2, _080ACC38 @ =0x01000040
	mov r0, sp
	bl CpuSet
	mov r0, sp
	adds r0, #2
	mov r2, r8
	strh r2, [r0]
	ldr r4, _080ACC3C @ =0x08CE5774
	ldr r1, [r4]
	ldr r2, _080ACC40 @ =0x01000142
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ACCCE
	ldr r0, [r4]
	ldr r1, _080ACC44 @ =0x08CE5778
	ldr r1, [r1]
	movs r2, #0xa1
	bl CpuFastSet
	movs r3, #0
	movs r7, #0
_080ACC14:
	ldr r0, _080ACC3C @ =0x08CE5774
	ldr r1, [r0]
	adds r2, r1, r7
	movs r1, #3
	ldrb r4, [r2]
	ands r1, r4
	cmp r1, #0
	beq _080ACCB6
	ldrb r1, [r2, #1]
	cmp r1, #1
	beq _080ACC4E
	cmp r1, #1
	bgt _080ACC48
	cmp r1, #0
	beq _080ACC5A
	b _080ACC98
	.align 2, 0
_080ACC34: .4byte 0x08CE577C
_080ACC38: .4byte 0x01000040
_080ACC3C: .4byte 0x08CE5774
_080ACC40: .4byte 0x01000142
_080ACC44: .4byte 0x08CE5778
_080ACC48:
	cmp r1, #2
	beq _080ACC5A
	b _080ACC98
_080ACC4E:
	ldr r0, _080ACC84 @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080ACCB6
_080ACC5A:
	ldr r5, _080ACC88 @ =0x08CE577C
	ldr r0, [r5]
	mov r1, r8
	lsls r4, r1, #2
	adds r0, r4, r0
	movs r6, #0
	strb r3, [r0]
	str r3, [sp, #4]
	bl GetBonusContentClaimFlags
	movs r2, #1
	adds r1, r2, #0
	ldr r3, [sp, #4]
	lsls r1, r3
	ands r1, r0
	cmp r1, #0
	beq _080ACC8C
	ldr r0, [r5]
	adds r0, r4, r0
	strb r6, [r0, #1]
	b _080ACC92
	.align 2, 0
_080ACC84: .4byte 0x0202BBF8
_080ACC88: .4byte 0x08CE577C
_080ACC8C:
	ldr r0, [r5]
	adds r0, r4, r0
	strb r2, [r0, #1]
_080ACC92:
	movs r2, #1
	add r8, r2
	ldr r0, _080ACCD8 @ =0x08CE5774
_080ACC98:
	ldr r1, [r0]
	adds r1, r1, r7
	movs r0, #3
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #1
	bne _080ACCB6
	ldr r0, _080ACCDC @ =0x08CE5778
	ldr r1, [r0]
	adds r1, r1, r7
	movs r0, #0xfc
	ldrb r4, [r1]
	ands r0, r4
	adds r0, #2
	strb r0, [r1]
_080ACCB6:
	adds r7, #0x14
	adds r3, #1
	cmp r3, #0x1f
	ble _080ACC14
	ldr r0, _080ACCE0 @ =0x08CE5780
	ldr r0, [r0]
	mov r1, r8
	str r1, [r0]
	ldr r0, _080ACCDC @ =0x08CE5778
	ldr r0, [r0]
	bl SaveBonusContentData
_080ACCCE:
	mov r2, r8
	cmp r2, #0
	beq _080ACCE4
	movs r0, #1
	b _080ACCE6
	.align 2, 0
_080ACCD8: .4byte 0x08CE5774
_080ACCDC: .4byte 0x08CE5778
_080ACCE0: .4byte 0x08CE5780
_080ACCE4:
	movs r0, #0
_080ACCE6:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

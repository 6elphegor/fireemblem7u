	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AB440
sub_080AB440: @ 0x080AB440
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x18
	adds r7, r0, #0
	add r0, sp, #0x14
	movs r1, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x50
	ldr r2, _080AB4BC @ =0x01000008
	bl CpuSet
	mov r0, sp
	bl LoadAndVerfyLinkArenaStruct2
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB4D6
	movs r4, #0
	movs r0, #1
	mov ip, r0
	ldr r1, _080AB4C0 @ =0x08CE538C
	mov r8, r1
_080AB470:
	asrs r1, r4, #5
	lsls r1, r1, #2
	add r1, sp
	movs r0, #0x1f
	ands r0, r4
	ldr r1, [r1]
	lsrs r1, r0
	mov r0, ip
	ands r1, r0
	cmp r4, #0xa
	bgt _080AB488
	movs r1, #1
_080AB488:
	adds r6, r4, #1
	cmp r1, #0
	beq _080AB4D0
	movs r3, #0
	mov r1, r8
	ldr r0, [r1]
	ldr r1, _080AB4C0 @ =0x08CE538C
	cmp r0, #0
	blt _080AB4D0
	movs r5, #0x1f
	adds r2, r1, #0
	mov r1, r8
_080AB4A0:
	ldr r0, [r1]
	cmp r0, r4
	bne _080AB4C4
	asrs r2, r3, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	ands r3, r5
	mov r1, ip
	lsls r1, r3
	ldr r0, [r2, #0x50]
	orrs r0, r1
	str r0, [r2, #0x50]
	b _080AB4D0
	.align 2, 0
_080AB4BC: .4byte 0x01000008
_080AB4C0: .4byte 0x08CE538C
_080AB4C4:
	adds r2, #4
	adds r1, #4
	adds r3, #1
	ldr r0, [r2]
	cmp r0, #0
	bge _080AB4A0
_080AB4D0:
	adds r4, r6, #0
	cmp r4, #0x7f
	ble _080AB470
_080AB4D6:
	adds r1, r7, #0
	adds r1, #0x39
	movs r0, #0xff
	strb r0, [r1]
	add sp, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

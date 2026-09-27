	.include "macro.inc"

	.syntax unified

	thumb_func_start AnimDisplayPrivate
AnimDisplayPrivate: @ 0x08006850
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0800695C @ =0x0300291C
	ldrh r0, [r4]
	str r0, [sp]
	ldr r2, [r7, #0x3c]
	cmp r2, #0
	beq _0800694C
	ldr r3, [r2]
	ldr r1, _08006960 @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _080068B0
	ldr r6, _08006964 @ =0x0000FFFF
	ands r6, r3
	cmp r6, #0
	beq _080068B0
	ldr r3, _08006968 @ =0x03003948
_08006880:
	ldr r0, [r3]
	ldrh r1, [r2, #4]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #6]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #8]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r1, [r2, #0xa]
	strh r1, [r0, #6]
	adds r0, #8
	str r0, [r3]
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	subs r6, #1
	adds r2, #0xc
	cmp r6, #0
	bne _08006880
_080068B0:
	adds r5, r2, #0
	ldr r0, [r5]
	cmp r0, #1
	beq _0800694C
	ldr r2, _0800696C @ =0x03002F34
	ldr r0, [r2]
	ldr r1, _08006970 @ =0x03002D30
	mov sl, r1
	cmp r0, sl
	bhs _0800694C
	movs r0, #0x80
	lsls r0, r0, #1
	mov sb, r0
	movs r1, #0x40
	rsbs r1, r1, #0
	mov r8, r1
	mov ip, r2
_080068D2:
	movs r2, #6
	ldrsh r1, [r5, r2]
	movs r2, #2
	ldrsh r0, [r7, r2]
	adds r3, r1, r0
	movs r0, #8
	ldrsh r1, [r5, r0]
	movs r2, #4
	ldrsh r0, [r7, r2]
	adds r4, r1, r0
	cmp r3, sb
	bgt _080068EE
	cmp r3, r8
	bge _080068F2
_080068EE:
	movs r3, #0xc0
	lsls r3, r3, #1
_080068F2:
	cmp r4, #0xa0
	bgt _080068FA
	cmp r4, r8
	bge _080068FE
_080068FA:
	movs r3, #0xc0
	lsls r3, r3, #1
_080068FE:
	ldr r0, _08006974 @ =0x000001FF
	ands r3, r0
	movs r0, #0xff
	ands r4, r0
	movs r6, #0
	ldr r1, [r5]
	adds r0, r1, #0
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _08006918
	ldr r0, [sp]
	lsls r6, r0, #0x19
_08006918:
	ldr r0, [r7, #0x1c]
	adds r6, r6, r0
	mov r0, ip
	ldr r2, [r0]
	adds r0, r1, r6
	lsls r1, r3, #0x10
	orrs r0, r1
	orrs r0, r4
	stm r2!, {r0}
	mov r1, ip
	str r2, [r1]
	ldr r0, _08006978 @ =0x0000F3FF
	ldrh r1, [r5, #4]
	ands r0, r1
	ldrh r1, [r7, #8]
	adds r0, r1, r0
	strh r0, [r2]
	adds r2, #4
	mov r0, ip
	str r2, [r0]
	adds r5, #0xc
	ldr r0, [r5]
	cmp r0, #1
	beq _0800694C
	cmp r2, sl
	blo _080068D2
_0800694C:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800695C: .4byte 0x0300291C
_08006960: .4byte 0xFFFF0000
_08006964: .4byte 0x0000FFFF
_08006968: .4byte 0x03003948
_0800696C: .4byte 0x03002F34
_08006970: .4byte 0x03002D30
_08006974: .4byte 0x000001FF
_08006978: .4byte 0x0000F3FF

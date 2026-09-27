	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A5818
sub_080A5818: @ 0x080A5818
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r1, r0, #0
	adds r1, #0x42
	ldrh r2, [r1]
	adds r1, r2, #0
	cmp r1, #0xff
	bhi _080A584A
	cmp r1, #0x20
	bne _080A5844
	adds r0, #0x35
	ldrb r0, [r0]
	mov r1, r8
	adds r1, #0x33
	strb r0, [r1]
	b _080A584A
_080A5844:
	mov r0, r8
	adds r0, #0x33
	strb r2, [r0]
_080A584A:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x2f
	adds r1, r2, #0
	adds r1, #0x46
	ldrh r1, [r1]
	ldrb r0, [r0]
	adds r5, r1, r0
	cmp r5, #0xdb
	bgt _080A590A
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r3, [r0]
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #2
	movs r1, #0x44
	subs r6, r1, r0
	cmp r6, #1
	bgt _080A5876
	movs r6, #2
_080A5876:
	movs r7, #0
	cmp r7, r3
	bge _080A58E2
	adds r4, r6, #0
	movs r1, #0x38
	mov sb, r1
_080A5882:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A58BE
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_080A5514
	b _080A58D2
_080A58BE:
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	mov r2, sb
	subs r1, r2, r5
	adds r2, r4, #0
	bl sub_080A5514
_080A58D2:
	adds r4, #0x18
	adds r7, #1
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r7, r0
	blt _080A5882
_080A58E2:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #2
	bne _080A590A
	adds r0, #0x2b
	ldrb r3, [r0]
	lsls r2, r3, #1
	adds r2, r2, r3
	lsls r2, r2, #3
	adds r2, r6, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_080A5E8C
_080A590A:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x46
	ldrh r1, [r1]
	subs r1, #1
	lsls r1, r1, #0x10
	movs r2, #0xdb
	lsls r2, r2, #0x11
	adds r3, r0, #0
	cmp r1, r2
	bhi _080A59EC
	adds r1, r3, #0
	adds r1, #0x33
	ldrb r2, [r1]
	cmp r2, #7
	bne _080A5932
	movs r5, #2
	movs r6, #0x15
	b _080A5946
_080A5932:
	ldrb r2, [r1]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	movs r1, #0x44
	subs r5, r1, r0
	cmp r5, #1
	bgt _080A5944
	movs r5, #2
_080A5944:
	movs r6, #0x18
_080A5946:
	movs r7, #0
	adds r0, r3, #0
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	bge _080A59C6
	adds r4, r5, #0
_080A5956:
	adds r0, #0x32
	ldrb r0, [r0]
	adds r1, r7, #0
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl BitfileToIndex
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	mov r0, r8
	ldr r1, [r0, #0x14]
	adds r0, r1, #0
	adds r0, #0x34
	ldrb r0, [r0]
	cmp r7, r0
	bne _080A5998
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #1
	str r0, [sp]
	movs r0, #3
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_080A5590
	b _080A59B4
_080A5998:
	adds r0, r1, #0
	adds r0, #0x46
	movs r1, #0x8a
	lsls r1, r1, #1
	ldrh r0, [r0]
	subs r1, r1, r0
	movs r0, #4
	str r0, [sp]
	movs r0, #8
	str r0, [sp, #4]
	mov r0, r8
	adds r2, r4, #0
	bl sub_080A5590
_080A59B4:
	adds r4, r4, r6
	adds r7, #1
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x33
	ldrb r1, [r1]
	cmp r7, r1
	blt _080A5956
_080A59C6:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	cmp r1, #0xa
	bne _080A59EC
	adds r0, #0x34
	ldrb r0, [r0]
	adds r2, r0, #0
	muls r2, r6, r2
	adds r2, r5, r2
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #0
	movs r1, #0x24
	mov r3, r8
	bl sub_080A5E8C
_080A59EC:
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A59FA
	b _080A5B78
_080A59FA:
	mov r0, r8
	bl sub_080A5214
	mov r0, r8
	bl sub_080A5748
	movs r7, #0
	movs r0, #0xf
	mov sl, r0
_080A5A0C:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2e
	movs r2, #0
	mov sb, r2
	ldrb r1, [r1]
	cmp r1, #6
	bne _080A5A2C
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080A5A2C
	movs r3, #0x80
	lsls r3, r3, #1
	mov sb, r3
_080A5A2C:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xe8
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A5AE8 @ =0x000001FF
	ands r1, r2
	lsls r5, r7, #5
	adds r2, r5, #0
	adds r2, #0x20
	add r2, sb
	ldr r0, _080A5AEC @ =0x08CE45B4
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r0, [r0]
	mov ip, r0
	lsls r4, r7, #1
	adds r0, r4, #0
	adds r0, #0xa
	mov r3, sl
	ands r0, r3
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	mov r3, ip
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	movs r1, #0xf4
	ldrb r0, [r0]
	subs r1, r1, r0
	ldr r2, _080A5AE8 @ =0x000001FF
	ands r1, r2
	adds r5, #0x21
	add r5, sb
	adds r5, #8
	ldr r0, _080A5AF0 @ =0x08CE45A8
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r0, sl
	ands r4, r0
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	adds r7, #1
	cmp r7, #2
	ble _080A5A0C
	mov r1, r8
	ldr r2, [r1, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080A5B78
	adds r1, r2, #0
	adds r1, #0x44
	movs r0, #0x80
	lsls r0, r0, #1
	ldrh r1, [r1]
	cmp r1, r0
	beq _080A5B18
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080A5AC6
	bl EndSpriteAnimProc
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080A5AC6:
	mov r3, r8
	ldr r2, [r3, #0x14]
	adds r1, r2, #0
	adds r1, #0x42
	movs r0, #1
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080A5AF8
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5AF4 @ =0x08CE41B4
	movs r0, #0
	b _080A5B08
	.align 2, 0
_080A5AE8: .4byte 0x000001FF
_080A5AEC: .4byte 0x08CE45B4
_080A5AF0: .4byte 0x08CE45A8
_080A5AF4: .4byte 0x08CE41B4
_080A5AF8:
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5B14 @ =0x08CE41B4
	movs r0, #0xc0
	lsls r0, r0, #7
_080A5B08:
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080A5B78
	.align 2, 0
_080A5B14: .4byte 0x08CE41B4
_080A5B18:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080A5B3E
	ldr r0, [r2, #0x60]
	adds r2, #0x2f
	movs r1, #0xda
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	b _080A5B78
_080A5B3E:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r3, [r3]
	lsls r2, r3, #5
	adds r2, #0x34
	movs r3, #0xb0
	lsls r3, r3, #1
	bl SetSpriteAnimProcParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r2, r0, #0
	adds r2, #0x2f
	movs r1, #0xd3
	lsls r1, r1, #1
	ldrb r2, [r2]
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r0, [r0]
	lsls r2, r0, #5
	adds r2, #0x1e
	ldr r3, _080A5BE8 @ =0x08CE41B4
	movs r0, #0xc0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080A5B78:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080A5C30
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A5BF0
	ldr r3, _080A5BEC @ =0x08CE4172
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x28
	movs r2, #0x80
	bl PutSpriteExt
	mov r3, r8
	ldr r0, [r3, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, #0x34
	movs r1, #0x88
	bl PutUiHand
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r2, r0, #0x1d
	movs r3, #0x80
	lsls r3, r3, #0x16
	adds r2, r2, r3
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_080A5E8C
	b _080A5C0E
	.align 2, 0
_080A5BE8: .4byte 0x08CE41B4
_080A5BEC: .4byte 0x08CE4172
_080A5BF0:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A5C0E
	ldrb r1, [r1]
	lsls r2, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r2, r2, r0
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_080A5E8C
_080A5C0E:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080A5C30
	ldrb r1, [r1]
	lsls r1, r1, #0x1d
	movs r2, #0x80
	lsls r2, r2, #0x16
	adds r1, r1, r2
	lsrs r1, r1, #0x18
	movs r0, #1
	mov r2, r8
	bl sub_080A5EAC
_080A5C30:
	mov r0, r8
	bl sub_080A560C
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

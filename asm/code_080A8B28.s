	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A8B28
sub_080A8B28: @ 0x080A8B28
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	ldr r7, [r5, #0x34]
	ldr r0, [r5, #0x3c]
	mov r8, r0
	ldr r1, [r5, #0x38]
	mov sb, r1
	ldr r2, [r5, #0x40]
	mov sl, r2
	ldr r0, [r5, #0x44]
	adds r0, #1
	str r0, [r5, #0x44]
	ldr r0, [r5, #0x48]
	adds r0, #1
	str r0, [r5, #0x48]
	movs r6, #0
_080A8B52:
	lsls r3, r6, #2
	adds r0, r5, #0
	adds r0, #0x4c
	adds r2, r0, r3
	ldr r0, [r2]
	adds r4, r5, #0
	adds r4, #0x44
	cmp r0, #0
	beq _080A8B72
	adds r0, r4, r3
	ldr r1, [r0]
	adds r1, #3
	str r1, [r0]
	ldr r0, [r2]
	adds r0, #1
	str r0, [r2]
_080A8B72:
	adds r1, r4, r3
	ldr r0, [r1]
	asrs r0, r0, #3
	cmp r0, #5
	ble _080A8B80
	movs r0, #0
	str r0, [r1]
_080A8B80:
	adds r6, #1
	cmp r6, #1
	ble _080A8B52
	ldr r3, [r5, #0x2c]
	cmp r3, #0
	bne _080A8C14
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A8BA0
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x34]
	adds r7, r0, r1
	cmp r2, #4
	bne _080A8BA0
	str r3, [r5, #0x4c]
_080A8BA0:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A8BB8
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x38]
	subs r0, r0, r1
	mov sb, r0
	cmp r2, #4
	bne _080A8BB8
	movs r0, #0
	str r0, [r5, #0x50]
_080A8BB8:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8BE2
	ldr r1, _080A8CC8 @ =0x000001FF
	ands r1, r7
	movs r2, #0xff
	mov r0, r8
	ands r2, r0
	ldr r3, _080A8CCC @ =0x08CE4A28
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A8BE2:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8C14
	ldr r1, _080A8CC8 @ =0x000001FF
	mov r2, sb
	ands r1, r2
	movs r0, #0x80
	lsls r0, r0, #5
	adds r1, r1, r0
	movs r2, #0xff
	mov r0, sl
	ands r2, r0
	ldr r3, _080A8CCC @ =0x08CE4A28
	adds r4, r5, #0
	adds r4, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	ldrh r4, [r4]
	adds r0, r4, r0
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080A8C14:
	ldr r0, [r5, #0x2c]
	cmp r0, #1
	bne _080A8CB6
	ldr r2, [r5, #0x4c]
	cmp r2, #0
	beq _080A8C32
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x3c]
	adds r0, r0, r1
	mov r8, r0
	cmp r2, #4
	bne _080A8C32
	movs r0, #0
	str r0, [r5, #0x4c]
_080A8C32:
	ldr r2, [r5, #0x50]
	cmp r2, #0
	beq _080A8C4A
	asrs r2, r2, #3
	subs r1, r2, #4
	ldr r0, [r5, #0x40]
	subs r0, r0, r1
	mov sl, r0
	cmp r2, #4
	bne _080A8C4A
	movs r0, #0
	str r0, [r5, #0x50]
_080A8C4A:
	ldr r0, [r5, #0x30]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080A8C7C
	ldr r0, _080A8CC8 @ =0x000001FF
	ands r7, r0
	movs r0, #0xff
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldr r3, _080A8CD0 @ =0x08CE4A36
	adds r1, r5, #0
	adds r1, #0x54
	ldr r0, [r5, #0x44]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r1, [r1]
	adds r0, r1, r0
	str r0, [sp]
	movs r0, #0xd
	adds r1, r7, #0
	mov r2, r8
	bl PutSpriteExt
_080A8C7C:
	ldr r0, [r5, #0x30]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080A8CB6
	ldr r0, _080A8CC8 @ =0x000001FF
	mov r2, sb
	ands r2, r0
	mov sb, r2
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, sb
	movs r0, #0xff
	mov r2, sl
	ands r2, r0
	mov sl, r2
	ldr r3, _080A8CD0 @ =0x08CE4A36
	adds r2, r5, #0
	adds r2, #0x54
	ldr r0, [r5, #0x48]
	asrs r0, r0, #3
	lsls r0, r0, #1
	ldrh r2, [r2]
	adds r0, r2, r0
	str r0, [sp]
	movs r0, #0xd
	mov r2, sl
	bl PutSpriteExt
_080A8CB6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8CC8: .4byte 0x000001FF
_080A8CCC: .4byte 0x08CE4A28
_080A8CD0: .4byte 0x08CE4A36

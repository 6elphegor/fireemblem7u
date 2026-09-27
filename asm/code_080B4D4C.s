	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B4D4C
sub_080B4D4C: @ 0x080B4D4C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	mov sb, r1
	lsls r2, r2, #0x10
	lsrs r4, r2, #0x10
	adds r6, r4, #0
	ldr r0, _080B4DE8 @ =0x08CE76C8
	bl Proc_Find
	mov r8, r0
	lsls r0, r7, #1
	adds r0, r0, r7
	lsls r0, r0, #2
	adds r0, #0x2c
	mov r2, r8
	ldr r1, [r2, #0x40]
	adds r5, r1, r0
	ldr r2, _080B4DEC @ =0x030028AC
	ldr r0, _080B4DF0 @ =0x0000FFE0
	ldrh r3, [r2]
	ands r0, r3
	ldr r1, _080B4DF4 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0x80
	lsls r3, r3, #4
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, [r5, #4]
	cmp r0, #0
	bne _080B4E76
	movs r0, #0xff
	ands r0, r4
	strh r0, [r5]
	movs r0, #0xff
	lsls r0, r0, #8
	ands r0, r4
	adds r0, r0, r1
	strh r0, [r5, #2]
	movs r0, #0
	ldrsh r2, [r5, r0]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r4
	ldr r1, _080B4DF8 @ =0x00000442
	cmp r0, #0
	beq _080B4DB4
	adds r1, #1
_080B4DB4:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r4
	cmp r0, #0
	beq _080B4DC4
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
_080B4DC4:
	str r1, [sp]
	adds r0, r7, #0
	mov r1, sb
	movs r3, #0x28
	bl StartBmFace
	adds r2, r0, #0
	str r2, [r5, #4]
	movs r1, #0xc0
	lsls r1, r1, #7
	adds r0, r4, #0
	ands r0, r1
	cmp r0, r1
	bne _080B4DFC
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #6
	b _080B4E26
	.align 2, 0
_080B4DE8: .4byte 0x08CE76C8
_080B4DEC: .4byte 0x030028AC
_080B4DF0: .4byte 0x0000FFE0
_080B4DF4: .4byte 0x0000E0FF
_080B4DF8: .4byte 0x00000442
_080B4DFC:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r4
	cmp r0, #0
	beq _080B4E0E
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #5
	b _080B4E26
_080B4E0E:
	movs r0, #0x80
	lsls r0, r0, #6
	ands r6, r0
	cmp r6, #0
	beq _080B4E20
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #4
	b _080B4E26
_080B4E20:
	adds r1, r2, #0
	adds r1, #0x41
	movs r0, #3
_080B4E26:
	strb r0, [r1]
	adds r0, r7, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	movs r6, #0
	movs r0, #1
	strb r0, [r5, #8]
	mov r1, r8
	adds r1, #0x44
	movs r0, #2
	strb r0, [r1]
	mov r4, r8
	adds r4, #0x45
	ldrb r1, [r4]
	cmp r1, #0x20
	bne _080B4E76
	strb r6, [r4]
	ldr r3, _080B4E84 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r4]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	movs r0, #0x10
	ldrb r4, [r4]
	subs r0, r0, r4
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r6, [r0]
_080B4E76:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4E84: .4byte 0x03002870

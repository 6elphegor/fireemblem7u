	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4108
sub_080A4108: @ 0x080A4108
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	adds r3, r7, #0
	adds r3, #0x29
	ldrb r0, [r3]
	cmp r0, #8
	bne _080A4180
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_080A6398
	movs r0, #4
	adds r1, r7, #0
	bl sub_080A6398
	ldrb r1, [r4]
	adds r0, r7, #0
	adds r0, #0x37
	adds r2, r0, r1
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080A415C
	lsls r0, r1, #0xb
	movs r1, #0xb4
	lsls r1, r1, #9
	adds r0, r0, r1
	ldr r1, _080A4158 @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	ldrb r1, [r2]
	bl PutChapterTitleGfx
	b _080A4172
	.align 2, 0
_080A4158: .4byte 0x0001FFFF
_080A415C:
	lsls r0, r1, #0xb
	movs r2, #0xb4
	lsls r2, r2, #9
	adds r0, r0, r2
	ldr r1, _080A417C @ =0x0001FFFF
	ands r0, r1
	lsrs r0, r0, #5
	movs r1, #1
	rsbs r1, r1, #0
	bl PutChapterTitleGfx
_080A4172:
	ldrb r0, [r4]
	bl sub_080A649C
	b _080A4248
	.align 2, 0
_080A417C: .4byte 0x0001FFFF
_080A4180:
	cmp r0, #0x20
	bne _080A41F6
	adds r0, r7, #0
	bl sub_080A602C
	adds r0, r7, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x10
	bne _080A41AA
	adds r0, r7, #0
	movs r1, #0x12
	bl Proc_Goto
	movs r0, #0xc0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080A4248
_080A41AA:
	cmp r0, #0x40
	bne _080A41B8
	adds r0, r7, #0
	movs r1, #0x11
	bl Proc_Goto
	b _080A4248
_080A41B8:
	adds r0, r7, #0
	bl sub_080A6220
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4248
	adds r2, r7, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080A41DC
	adds r0, r7, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080A41EC
_080A41DC:
	adds r4, r7, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #1
	movs r2, #1
	bl SaveMenuModifySaveSlot
	strb r0, [r4]
_080A41EC:
	adds r0, r7, #0
	movs r1, #5
	bl Proc_Goto
	b _080A4248
_080A41F6:
	cmp r0, #0x30
	bne _080A4248
	adds r0, r7, #0
	adds r0, #0x2c
	movs r1, #0
	strb r1, [r0]
	adds r2, r7, #0
	adds r2, #0x2d
	movs r0, #0xff
	strb r0, [r2]
	strb r1, [r3]
	adds r0, r7, #0
	adds r0, #0x2b
	strb r1, [r0]
	adds r0, #5
	ldrb r0, [r0]
	bl SaveMenuIndexToValidBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	adds r1, #0x42
	strh r0, [r1]
	ldr r0, _080A4240 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A4236
	ldr r0, _080A4244 @ =0x0000038B
	bl m4aSongNumStart
_080A4236:
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080A43CC
	.align 2, 0
_080A4240: .4byte 0x0202BBF8
_080A4244: .4byte 0x0000038B
_080A4248:
	adds r0, r7, #0
	adds r0, #0x29
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0x10
	bne _080A42C0
	ldr r4, _080A42BC @ =0x080C5A48
	movs r3, #0x80
	adds r3, r3, r4
	mov sb, r3
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	b _080A4338
	.align 2, 0
_080A42BC: .4byte 0x080C5A48
_080A42C0:
	cmp r1, #7
	bhi _080A4348
	ldr r4, _080A4344 @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	bl Div
	mov r8, r0
	mov r2, r8
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov r8, r2
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, r6, r1
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	adds r1, r6, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r6, r6, r1
	adds r1, r6, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	mov r1, r8
_080A4338:
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _080A43C4
	.align 2, 0
_080A4344: .4byte 0x080C5A48
_080A4348:
	cmp r1, #0xf
	bhi _080A43C4
	ldr r4, _080A43DC @ =0x080C5A48
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, sl
	ldrb r2, [r2]
	lsls r1, r2, #5
	subs r1, #0xe0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	lsls r0, r0, #4
	mov r1, r8
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r3, sl
	ldrb r3, [r3]
	lsls r1, r3, #5
	subs r1, #0xe0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r7, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_080A43C4:
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
_080A43CC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A43DC: .4byte 0x080C5A48

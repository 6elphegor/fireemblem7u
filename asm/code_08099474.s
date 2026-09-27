	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08099474
sub_08099474: @ 0x08099474
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov sb, r0
	ldr r1, [r0, #0x2c]
	asrs r0, r1, #3
	cmp r0, #5
	bgt _0809949C
	adds r0, r1, #2
	mov r1, sb
	str r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r0, #6
	bne _0809949C
	movs r0, #0xf
	bl sub_0809945C
_0809949C:
	mov r6, sb
	adds r6, #0x34
	movs r2, #9
	str r2, [sp, #8]
	movs r3, #4
	mov r8, r3
_080994A8:
	ldrb r0, [r6]
	cmp r0, #0xff
	beq _080994FE
	movs r5, #0
	ldrb r7, [r6]
	cmp r5, r7
	bgt _080994FE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	bge _080994FE
	movs r4, #0x50
	ldr r2, _0809959C @ =0x08CC5100
	mov sl, r2
_080994C6:
	lsls r1, r5, #9
	adds r1, r4, r1
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldr r3, [r3]
	mov ip, r3
	ldr r0, _080995A0 @ =0x0000F380
	str r0, [sp]
	movs r0, #4
	ldr r7, [sp, #8]
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r7, r3
	mov r3, ip
	bl PutSpriteExt
	adds r4, #0xf
	adds r5, #1
	ldrb r7, [r6]
	cmp r5, r7
	bgt _080994FE
	mov r1, sb
	ldr r0, [r1, #0x2c]
	asrs r0, r0, #3
	cmp r5, r0
	blt _080994C6
_080994FE:
	adds r6, #1
	ldr r2, [sp, #8]
	adds r2, #0x10
	str r2, [sp, #8]
	movs r3, #1
	rsbs r3, r3, #0
	add r8, r3
	mov r7, r8
	cmp r7, #0
	bge _080994A8
	movs r0, #0
	mov r8, r0
	movs r7, #0x80
	lsls r7, r7, #1
	ldr r1, _080995A4 @ =0x080C5A48
	mov sl, r1
_0809951E:
	mov r2, r8
	adds r2, #1
	lsls r1, r2, #3
	mov r3, sb
	ldr r0, [r3, #0x2c]
	subs r0, r0, r1
	lsls r4, r0, #5
	str r2, [sp, #4]
	cmp r4, r7
	ble _08099536
	movs r4, #0x80
	lsls r4, r4, #1
_08099536:
	cmp r4, #0x20
	ble _080995AC
	ldr r1, _080995A8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r3, sl
	movs r1, #0
	ldrsh r0, [r3, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r4, #0
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r1, _080995A8 @ =0x080C5AC8
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	b _0809960A
	.align 2, 0
_0809959C: .4byte 0x08CC5100
_080995A0: .4byte 0x0000F380
_080995A4: .4byte 0x080C5A48
_080995A8: .4byte 0x080C5AC8
_080995AC:
	ldr r3, _08099624 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sl
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	movs r1, #0x20
	bl Div
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _08099624 @ =0x080C5AC8
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
_0809960A:
	ldr r2, [sp, #4]
	mov r8, r2
	cmp r2, #4
	ble _0809951E
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08099624: .4byte 0x080C5AC8

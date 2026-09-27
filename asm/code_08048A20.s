	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048A20
sub_08048A20: @ 0x08048A20
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x30
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	mov r8, r0
	ldr r1, [r7, #0x30]
	str r1, [sp, #0xc]
	adds r1, #8
	mov sl, r1
	ldr r0, [r7, #0x38]
	asrs r2, r0, #3
	str r2, [sp, #0x10]
	movs r1, #7
	ands r0, r1
	movs r1, #8
	subs r0, r1, r0
	str r0, [sp, #0x14]
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	adds r1, r7, #0
	adds r1, #0x42
	ldrh r1, [r1]
	muls r0, r1, r0
	asrs r0, r0, #8
	str r0, [sp, #0x18]
	movs r0, #0x3c
	adds r0, r0, r7
	mov ip, r0
	movs r1, #0x3d
	adds r1, r1, r7
	mov sb, r1
	ldrb r2, [r0]
	ldrb r3, [r1]
	cmp r2, r3
	bhi _08048A70
	b _08048BC8
_08048A70:
	adds r5, r7, #0
	adds r5, #0x44
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x45
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	adds r0, r7, #0
	adds r0, #0x40
	movs r1, #0x3e
	ldrsh r2, [r7, r1]
	movs r3, #0
	ldrsh r1, [r0, r3]
	adds r3, r5, #0
	str r0, [sp, #0x2c]
	cmp r2, r1
	bge _08048A9E
	ldrb r0, [r3]
	adds r0, #2
	strb r0, [r3]
_08048A9E:
	movs r0, #0x3e
	ldrsh r1, [r7, r0]
	ldr r2, [sp, #0x2c]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _08048AB2
	ldrb r0, [r4]
	adds r0, #2
	strb r0, [r4]
_08048AB2:
	movs r6, #0
	mov r0, ip
	str r0, [sp, #0x28]
	ldr r1, [sp, #0x18]
	add r1, sl
	str r1, [sp, #0x1c]
	ldr r2, [sp, #0x10]
	lsls r2, r2, #3
	str r2, [sp, #0x24]
	ldr r3, [sp, #0xc]
	str r3, [sp, #0x20]
_08048AC8:
	ldrb r0, [r5]
	cmp r0, #0x30
	bls _08048AD2
	movs r0, #0
	strb r0, [r5]
_08048AD2:
	lsls r4, r6, #2
	add r4, sp
	adds r4, #4
	ldrb r1, [r5]
	lsrs r0, r1, #3
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4]
	adds r5, #1
	adds r6, #1
	cmp r6, #1
	ble _08048AC8
	movs r2, #0x3e
	ldrsh r0, [r7, r2]
	cmp r0, #0
	beq _08048B0A
	mov r2, sl
	subs r2, #9
	ldr r3, _08048BD8 @ =0x08B9A550
	ldr r0, [sp, #4]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_08048B0A:
	movs r3, #0x3e
	ldrsh r0, [r7, r3]
	cmp r0, #0
	bge _08048B14
	adds r0, #0xf
_08048B14:
	asrs r0, r0, #4
	mov r1, sb
	ldrb r1, [r1]
	adds r0, r1, r0
	ldr r2, [sp, #0x28]
	ldrb r2, [r2]
	cmp r0, r2
	bge _08048B3A
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	adds r2, #1
	ldr r3, _08048BDC @ =0x08B9A548
	ldr r0, [sp, #8]
	str r0, [sp]
	movs r0, #3
	mov r1, r8
	bl PutSprite
_08048B3A:
	movs r6, #0
	ldr r0, [r7, #0x34]
	cmp r6, r0
	bge _08048B5E
	mov r4, sl
	movs r5, #1
_08048B46:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _08048BE0 @ =0x08B9A558
	bl PutSprite
	adds r4, #8
	adds r6, #1
	ldr r0, [r7, #0x34]
	cmp r6, r0
	blt _08048B46
_08048B5E:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _08048B80
	ldr r4, [sp, #0x1c]
	movs r5, #0
	adds r6, r3, #0
_08048B6A:
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	adds r2, r4, #0
	ldr r3, _08048BE0 @ =0x08B9A558
	bl PutSprite
	adds r4, #8
	subs r6, #1
	cmp r6, #0
	bne _08048B6A
_08048B80:
	ldr r0, [sp, #0x1c]
	ldr r1, [sp, #0x24]
	adds r2, r0, r1
	ldr r3, [sp, #0x14]
	subs r2, r2, r3
	ldr r4, _08048BE0 @ =0x08B9A558
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r1, r8
	adds r3, r4, #0
	bl PutSprite
	movs r5, #2
	str r5, [sp]
	movs r0, #2
	mov r1, r8
	ldr r2, [sp, #0x20]
	adds r3, r4, #0
	bl PutSprite
	movs r1, #0x80
	lsls r1, r1, #6
	add r1, r8
	ldr r2, [r7, #0x34]
	lsls r2, r2, #3
	add r2, sl
	subs r2, #7
	str r5, [sp]
	movs r0, #2
	adds r3, r4, #0
	bl PutSprite
	ldrh r0, [r7, #0x3e]
	ldr r1, [sp, #0x2c]
	strh r0, [r1]
_08048BC8:
	add sp, #0x30
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08048BD8: .4byte 0x08B9A550
_08048BDC: .4byte 0x08B9A548
_08048BE0: .4byte 0x08B9A558

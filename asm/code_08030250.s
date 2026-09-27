	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030250
sub_08030250: @ 0x08030250
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	ldr r0, _080302FC @ =0x08B96444
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x2c
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080302EC
	ldrb r5, [r5]
	lsls r5, r5, #0x18
	cmp r5, #0
	blt _080302EC
	ldr r0, _08030300 @ =0x08B96410
	mov sb, r0
_08030276:
	ldr r0, _080302FC @ =0x08B96444
	ldr r1, [r0]
	asrs r6, r5, #0x18
	adds r0, r1, #0
	adds r0, #0x2d
	adds r0, r0, r6
	movs r2, #0
	ldrsb r2, [r0, r2]
	adds r1, #0x41
	adds r1, r1, r6
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r7, r2, #4
	lsls r0, r0, #4
	mov r8, r0
	adds r0, r7, #0
	mov r1, r8
	movs r2, #0x10
	movs r3, #0x10
	bl PointInCameraBounds
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080302E4
	lsrs r5, r5, #0x18
	adds r0, r5, #0
	bl sub_08030138
	adds r4, r0, #0
	adds r0, r5, #0
	bl sub_0803019C
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x17
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #1
	adds r4, r4, r1
	add r4, sb
	ldrh r3, [r4]
	ldr r0, _08030304 @ =0x0202BBB8
	movs r2, #0xc
	ldrsh r1, [r0, r2]
	subs r1, r7, r1
	movs r4, #0xe
	ldrsh r2, [r0, r4]
	mov r0, r8
	subs r2, r0, r2
	str r3, [sp]
	movs r0, #0xb
	ldr r3, _08030308 @ =0x08B905B8
	bl PutSprite
_080302E4:
	subs r0, r6, #1
	lsls r5, r0, #0x18
	cmp r5, #0
	bge _08030276
_080302EC:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080302FC: .4byte 0x08B96444
_08030300: .4byte 0x08B96410
_08030304: .4byte 0x0202BBB8
_08030308: .4byte 0x08B905B8

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048298
sub_08048298: @ 0x08048298
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080482D8 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080482B0
	b _08048420
_080482B0:
	adds r0, r7, #0
	adds r0, #0x44
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #0xc0
	lsls r2, r2, #4
	mov r8, r2
	str r0, [sp, #4]
	cmp r1, #0
	beq _080482CA
	movs r0, #0x80
	lsls r0, r0, #3
	mov r8, r0
_080482CA:
	ldr r3, _080482DC @ =0x08B9A428
	cmp r1, #0
	beq _080482E0
	movs r0, #0x80
	lsls r0, r0, #4
	b _080482E4
	.align 2, 0
_080482D8: .4byte 0x0203D90C
_080482DC: .4byte 0x08B9A428
_080482E0:
	movs r0, #0x80
	lsls r0, r0, #3
_080482E4:
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	bge _08048346
	movs r5, #0x20
_080482FA:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r4, r0, r1
	movs r2, #0
	ldrsh r1, [r4, r2]
	adds r1, #8
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #0xc
	add r0, r8
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _08048400 @ =0x081D55FE
	bl PutSprite
	adds r0, r7, #0
	adds r0, #0x3a
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804833C
	movs r0, #0
	ldrsh r1, [r4, r0]
	adds r1, #8
	mov r2, r8
	str r2, [sp]
	movs r0, #4
	adds r2, r5, #0
	ldr r3, _08048404 @ =0x081D562C
	bl PutSprite
_0804833C:
	adds r5, #0x18
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _080482FA
_08048346:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	beq _080483F8
	ldr r0, _08048408 @ =0x0203DCE8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _08048376
	bl GetGameTime
	ldr r2, _0804840C @ =0x02022860
	movs r1, #0x3f
	ands r1, r0
	lsrs r1, r1, #2
	lsls r1, r1, #1
	ldr r0, _08048410 @ =0x0840628C
	adds r1, r1, r0
	ldrh r0, [r1]
	ldr r1, _08048414 @ =0x0000031A
	adds r2, r2, r1
	strh r0, [r2]
	bl EnablePalSync
_08048376:
	ldr r0, [r7, #0x40]
	cmp r0, #0xff
	bgt _08048380
	adds r0, #0x10
	str r0, [r7, #0x40]
_08048380:
	ldr r4, _08048418 @ =0x080C5A48
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl Div
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [r7, #0x40]
	bl Div
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
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
	ldr r1, [r7, #0x40]
	bl Div
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl SetObjAffine
	ldr r3, _0804841C @ =0x081D5646
	movs r0, #0x80
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x78
	movs r2, #0
	bl PutSprite
_080483F8:
	bl sub_08048240
	b _080484AE
	.align 2, 0
_08048400: .4byte 0x081D55FE
_08048404: .4byte 0x081D562C
_08048408: .4byte 0x0203DCE8
_0804840C: .4byte 0x02022860
_08048410: .4byte 0x0840628C
_08048414: .4byte 0x0000031A
_08048418: .4byte 0x080C5A48
_0804841C: .4byte 0x081D5646
_08048420:
	ldr r3, _08048488 @ =0x08B9A428
	movs r0, #0
	str r0, [sp]
	movs r0, #0xb
	movs r1, #0x50
	movs r2, #0x20
	bl PutSprite
	movs r6, #0
	ldr r0, [r7, #0x2c]
	adds r1, r7, #0
	adds r1, #0x44
	str r1, [sp, #4]
	cmp r6, r0
	bge _080484AA
	ldr r2, _0804848C @ =0x08B9A4A0
	mov sl, r2
	movs r0, #8
	rsbs r0, r0, #0
	mov sb, r0
	movs r1, #0x28
	mov r8, r1
_0804844C:
	lsls r1, r6, #1
	adds r0, r7, #0
	adds r0, #0x30
	adds r5, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	adds r4, r7, #0
	adds r4, #0x3a
	adds r4, r4, r6
	ldrb r2, [r4]
	lsls r0, r2, #2
	add r0, sl
	ldr r3, [r0]
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	mov r2, r8
	bl PutSprite
	ldrb r0, [r4]
	cmp r0, #0
	beq _08048490
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, #0
	bge _0804849E
	adds r0, r1, #1
	b _0804849C
	.align 2, 0
_08048488: .4byte 0x08B9A428
_0804848C: .4byte 0x08B9A4A0
_08048490:
	ldrh r1, [r5]
	movs r2, #0
	ldrsh r0, [r5, r2]
	cmp r0, sb
	ble _0804849E
	subs r0, r1, #1
_0804849C:
	strh r0, [r5]
_0804849E:
	movs r0, #0x10
	add r8, r0
	adds r6, #1
	ldr r0, [r7, #0x2c]
	cmp r6, r0
	blt _0804844C
_080484AA:
	bl sub_080481E4
_080484AE:
	ldr r0, _080484FC @ =0x0203D90C
	movs r1, #0x80
	lsls r1, r1, #4
	mov r8, r1
	ldrb r0, [r0]
	cmp r0, #1
	bne _080484C2
	movs r2, #0x80
	lsls r2, r2, #3
	mov r8, r2
_080484C2:
	ldr r1, [sp, #4]
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _080484D4
	movs r0, #0xc0
	movs r1, #0x10
	bl PutLinkArenaButtonSpriteAt
_080484D4:
	ldr r0, [r7, #0x48]
	cmp r0, #0
	blt _080484EC
	adds r2, r0, #0
	adds r2, #8
	ldr r3, _08048500 @ =0x08B9A466
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	movs r1, #0x50
	bl PutSprite
_080484EC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080484FC: .4byte 0x0203D90C
_08048500: .4byte 0x08B9A466

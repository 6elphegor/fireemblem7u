	.include "macro.inc"

	.syntax unified

	thumb_func_start HandleMapCursorInput
HandleMapCursorInput: @ 0x080155EC
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	mov ip, r1
	lsrs r7, r0, #0x14
	movs r0, #0xf
	ands r7, r0
	ldr r3, _080156EC @ =0x0202BBB8
	ldr r4, _080156F0 @ =0x08B92D28
	lsls r2, r7, #1
	adds r0, r2, r4
	movs r1, #0
	ldrsb r1, [r0, r1]
	ldrh r0, [r3, #0x14]
	adds r1, r0, r1
	lsls r1, r1, #0x10
	adds r0, r4, #1
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	ldrh r2, [r3, #0x16]
	adds r0, r2, r0
	lsls r0, r0, #0x10
	lsrs r6, r1, #0x10
	orrs r6, r0
	movs r0, #2
	ldrb r1, [r3, #4]
	ands r0, r1
	adds r5, r3, #0
	cmp r0, #0
	beq _0801566A
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	ldr r1, _080156F4 @ =0x0202E3E4
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	movs r3, #0x14
	ldrsh r1, [r5, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bhi _0801566A
	asrs r0, r6, #0x10
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x77
	bls _0801566A
	movs r0, #0xf0
	ldr r1, _080156F8 @ =0x08B857F8
	ldr r2, [r1]
	mov r1, ip
	ands r1, r0
	ldrh r2, [r2, #8]
	ands r0, r2
	cmp r1, r0
	bne _0801570E
_0801566A:
	lsls r0, r6, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _08015694
	ldr r0, _080156FC @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r1, r0
	bge _08015694
	lsls r0, r7, #1
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r3, [r5, #0x1c]
	adds r0, r3, r0
	strh r0, [r5, #0x1c]
	ldrh r0, [r5, #0x14]
	strh r0, [r5, #0x18]
	strh r6, [r5, #0x14]
_08015694:
	asrs r2, r6, #0x10
	adds r1, r2, #0
	cmp r1, #0
	blt _080156C0
	ldr r0, _080156FC @ =0x0202E3D8
	movs r3, #2
	ldrsh r0, [r0, r3]
	cmp r1, r0
	bge _080156C0
	lsls r0, r7, #1
	adds r1, r4, #1
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #4
	ldrh r1, [r5, #0x1e]
	adds r0, r1, r0
	strh r0, [r5, #0x1e]
	ldrh r0, [r5, #0x16]
	strh r0, [r5, #0x1a]
	strh r2, [r5, #0x16]
_080156C0:
	ldrb r1, [r5, #4]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08015708
	ldr r1, [r5, #0x14]
	ldr r0, [r5, #0x18]
	cmp r1, r0
	beq _0801570E
	ldr r0, _08015700 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080156E4
	ldr r0, _08015704 @ =0x00000385
	bl m4aSongNumStart
_080156E4:
	movs r0, #4
	ldrb r2, [r5, #4]
	orrs r0, r2
	b _0801570C
	.align 2, 0
_080156EC: .4byte 0x0202BBB8
_080156F0: .4byte 0x08B92D28
_080156F4: .4byte 0x0202E3E4
_080156F8: .4byte 0x08B857F8
_080156FC: .4byte 0x0202E3D8
_08015700: .4byte 0x0202BBF8
_08015704: .4byte 0x00000385
_08015708:
	movs r0, #0xfb
	ands r0, r1
_0801570C:
	strb r0, [r5, #4]
_0801570E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

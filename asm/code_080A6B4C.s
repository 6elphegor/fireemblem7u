	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6B4C
sub_080A6B4C: @ 0x080A6B4C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x2c]
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080A6C0A
	ldr r0, _080A6B90 @ =0x08B857F8
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6BCA
	ldr r0, _080A6B94 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6B7E
	ldr r0, _080A6B98 @ =0x0000038A
	bl m4aSongNumStart
_080A6B7E:
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	beq _080A6BAC
	cmp r0, #1
	bgt _080A6B9C
	cmp r0, #0
	beq _080A6BA2
	b _080A6CAE
	.align 2, 0
_080A6B90: .4byte 0x08B857F8
_080A6B94: .4byte 0x0202BBF8
_080A6B98: .4byte 0x0000038A
_080A6B9C:
	cmp r0, #2
	beq _080A6BB4
	b _080A6CAE
_080A6BA2:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	b _080A6CAE
_080A6BAC:
	adds r0, r4, #0
	bl sub_080A7194
	b _080A6BBA
_080A6BB4:
	adds r0, r4, #0
	bl sub_080A73E4
_080A6BBA:
	ldr r0, [r4, #0x2c]
	bl sub_080A6728
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080A6CAE
_080A6BCA:
	movs r0, #0xa
	ands r0, r1
	cmp r0, #0
	beq _080A6BF8
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A6BF0 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6CAE
	ldr r0, _080A6BF4 @ =0x0000038A
	bl m4aSongNumStart
	b _080A6CAE
	.align 2, 0
_080A6BF0: .4byte 0x0202BBF8
_080A6BF4: .4byte 0x0000038A
_080A6BF8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A6C20
	adds r0, r4, #0
	bl sub_080A6664
	b _080A6CAE
_080A6C0A:
	ldr r0, _080A6CB4 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x81
	lsls r0, r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080A6C20
	adds r0, r4, #0
	bl TactInfo_CloseHelpbox
_080A6C20:
	ldr r2, _080A6CB4 @ =0x08B857F8
	ldr r1, [r2]
	movs r0, #0x80
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C38
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	bne _080A6C38
	movs r0, #1
	str r0, [r4, #0x2c]
_080A6C38:
	ldr r1, [r2]
	movs r0, #0x40
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C4E
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080A6C4E
	movs r0, #0
	str r0, [r4, #0x2c]
_080A6C4E:
	ldr r1, [r2]
	movs r0, #0x20
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C64
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	ble _080A6C64
	subs r0, #1
	str r0, [r4, #0x2c]
_080A6C64:
	ldr r1, [r2]
	movs r0, #0x10
	ldrh r1, [r1, #6]
	ands r0, r1
	cmp r0, #0
	beq _080A6C7A
	ldr r0, [r4, #0x2c]
	cmp r0, #1
	bne _080A6C7A
	movs r0, #2
	str r0, [r4, #0x2c]
_080A6C7A:
	ldr r0, [r4, #0x2c]
	cmp r5, r0
	beq _080A6CAE
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080A6C94
	adds r0, r4, #0
	bl sub_080A6664
_080A6C94:
	ldr r0, [r4, #0x2c]
	adds r1, r4, #0
	bl UpdateTactMainHandShadow
	ldr r0, _080A6CB8 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A6CAE
	ldr r0, _080A6CBC @ =0x00000385
	bl m4aSongNumStart
_080A6CAE:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A6CB4: .4byte 0x08B857F8
_080A6CB8: .4byte 0x0202BBF8
_080A6CBC: .4byte 0x00000385

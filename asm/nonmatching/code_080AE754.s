	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AE754
sub_080AE754: @ 0x080AE754
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r3, #0
	movs r1, #0x30
	ldrsh r0, [r5, r1]
	cmp r0, #6
	bls _080AE768
	b _080AE9AC
_080AE768:
	lsls r0, r0, #2
	ldr r1, _080AE774 @ =_080AE778
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080AE774: .4byte _080AE778
_080AE778: @ jump table
	.4byte _080AE794 @ case 0
	.4byte _080AE988 @ case 1
	.4byte _080AE988 @ case 2
	.4byte _080AE988 @ case 3
	.4byte _080AE998 @ case 4
	.4byte _080AE998 @ case 5
	.4byte _080AE998 @ case 6
_080AE794:
	ldr r0, _080AE7B8 @ =0x08B857F8
	ldr r2, [r0]
	ldrh r1, [r2, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AE7C4
	ldr r0, _080AE7BC @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE81A
	ldr r0, _080AE7C0 @ =0x0000038B
	bl m4aSongNumStart
	b _080AE81A
	.align 2, 0
_080AE7B8: .4byte 0x08B857F8
_080AE7BC: .4byte 0x0202BBF8
_080AE7C0: .4byte 0x0000038B
_080AE7C4:
	movs r4, #1
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE834
	bl GetOptionMenuLayoutId
	ldr r1, _080AE824 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	adds r0, r0, r1
	ldr r1, _080AE828 @ =0x08CE583C
	ldr r1, [r1]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AE7F0
	b _080AE9AC
_080AE7F0:
	movs r0, #0
	bl sub_080AE360
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	beq _080AE800
	b _080AE9AC
_080AE800:
	ldr r0, _080AE82C @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE812
	ldr r0, _080AE830 @ =0x0000038A
	bl m4aSongNumStart
_080AE812:
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
_080AE81A:
	adds r0, r5, #0
	bl Proc_Break
	b _080AE9AC
	.align 2, 0
_080AE824: .4byte 0x08CE5868
_080AE828: .4byte 0x08CE583C
_080AE82C: .4byte 0x0202BBF8
_080AE830: .4byte 0x0000038A
_080AE834:
	ldrh r1, [r2, #6]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080AE918
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AE894
	ldr r0, _080AE890 @ =0x08CE583C
	ldr r2, [r0]
	ldrh r1, [r2, #0x2a]
	movs r6, #0x2a
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080AE8E2
	subs r0, r1, #1
	strh r0, [r2, #0x2a]
	movs r1, #0x2a
	ldrsh r0, [r2, r1]
	movs r3, #0x2c
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	cmp r0, #0
	bgt _080AE88A
	ldrh r1, [r2, #0x2c]
	movs r6, #0x2c
	ldrsh r0, [r2, r6]
	cmp r0, #0
	beq _080AE88A
	subs r0, r1, #1
	strh r0, [r2, #0x2c]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	subs r1, #1
	adds r0, r5, #0
	movs r2, #0
	bl sub_080AE6D0
	ldrh r0, [r5, #0x2e]
	subs r0, #4
	strh r0, [r5, #0x2e]
	strh r4, [r5, #0x30]
_080AE88A:
	movs r3, #1
	b _080AE8E6
	.align 2, 0
_080AE890: .4byte 0x08CE583C
_080AE894:
	ldr r0, _080AE908 @ =0x08CE583C
	ldr r2, [r0]
	movs r4, #0x2a
	ldrsh r1, [r2, r4]
	movs r6, #0x34
	ldrsh r0, [r2, r6]
	subs r0, #1
	cmp r1, r0
	bge _080AE8E2
	ldrh r0, [r2, #0x2a]
	adds r0, #1
	strh r0, [r2, #0x2a]
	movs r0, #0x2a
	ldrsh r1, [r2, r0]
	movs r3, #0x2c
	ldrsh r0, [r2, r3]
	subs r0, r1, r0
	cmp r0, #4
	ble _080AE8E0
	movs r4, #0x34
	ldrsh r0, [r2, r4]
	subs r0, #1
	cmp r1, r0
	bge _080AE8E0
	ldrh r0, [r2, #0x2c]
	adds r0, #1
	strh r0, [r2, #0x2c]
	adds r1, #1
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r5, #0
	bl sub_080AE6D0
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
	movs r0, #4
	strh r0, [r5, #0x30]
_080AE8E0:
	movs r3, #1
_080AE8E2:
	cmp r3, #0
	beq _080AE918
_080AE8E6:
	ldr r0, _080AE90C @ =0x08CE5B98
	adds r1, r5, #0
	bl Proc_Start
	movs r0, #5
	bl EnableBgSync
	ldr r0, _080AE910 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE9AC
	ldr r0, _080AE914 @ =0x00000386
	bl m4aSongNumStart
	b _080AE9AC
	.align 2, 0
_080AE908: .4byte 0x08CE583C
_080AE90C: .4byte 0x08CE5B98
_080AE910: .4byte 0x0202BBF8
_080AE914: .4byte 0x00000386
_080AE918:
	ldr r0, _080AE978 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0x30
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _080AE9AC
	ldr r4, _080AE97C @ =0x08CE58D8
	bl GetOptionMenuLayoutId
	ldr r1, _080AE980 @ =0x08CE5868
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	adds r1, #4
	mov r8, r1
	add r0, r8
	ldr r7, _080AE984 @ =0x08CE583C
	ldr r1, [r7]
	movs r2, #0x2a
	ldrsh r1, [r1, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r6, #0x2c
	ldrb r0, [r0]
	muls r0, r6, r0
	adds r4, #0x28
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080AE9AC
	bl GetOptionMenuLayoutId
	lsls r0, r0, #0x10
	asrs r0, r0, #0xd
	add r0, r8
	ldr r1, [r7]
	movs r3, #0x2a
	ldrsh r1, [r1, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	muls r0, r6, r0
	adds r0, r0, r4
	ldr r1, [r0]
	adds r0, r5, #0
	bl _call_via_r1
	b _080AE9AC
	.align 2, 0
_080AE978: .4byte 0x08B857F8
_080AE97C: .4byte 0x08CE58D8
_080AE980: .4byte 0x08CE5868
_080AE984: .4byte 0x08CE583C
_080AE988:
	ldrh r0, [r5, #0x2e]
	subs r0, #4
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	cmp r0, #3
	bne _080AE9A8
	movs r0, #0
	b _080AE9AA
_080AE998:
	ldrh r0, [r5, #0x2e]
	adds r0, #4
	strh r0, [r5, #0x2e]
	ldrh r0, [r5, #0x30]
	cmp r0, #6
	bne _080AE9A8
	movs r0, #0
	b _080AE9AA
_080AE9A8:
	adds r0, #1
_080AE9AA:
	strh r0, [r5, #0x30]
_080AE9AC:
	ldrh r2, [r5, #0x2e]
	movs r0, #2
	movs r1, #0
	bl SetBgOffset
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuTryMoveSaveSlotCursor
SaveMenuTryMoveSaveSlotCursor: @ 0x080A6184
	push {r4, r5, lr}
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	movs r1, #0
	adds r0, #0x2c
	ldrb r5, [r0]
	adds r0, #0x16
	ldrh r0, [r0]
	cmp r0, #4
	beq _080A61BC
	cmp r0, #4
	bgt _080A61A8
	cmp r0, #1
	beq _080A6218
	cmp r0, #2
	beq _080A61C6
	b _080A61C8
_080A61A8:
	cmp r0, #0x10
	beq _080A61C8
	cmp r0, #0x10
	bgt _080A61B6
	cmp r0, #8
	beq _080A61C6
	b _080A61C8
_080A61B6:
	cmp r0, #0x80
	bne _080A61C8
	b _080A61C6
_080A61BC:
	mov r0, ip
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080A61C8
_080A61C6:
	movs r1, #1
_080A61C8:
	lsls r0, r2, #0x18
	adds r2, r0, #0
	cmp r2, #0
	ble _080A61E4
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #2
	bne _080A61E0
	movs r0, #0
	b _080A61F6
_080A61E0:
	adds r0, r3, #1
	b _080A61F6
_080A61E4:
	mov r0, ip
	adds r0, #0x2c
	ldrb r3, [r0]
	adds r4, r0, #0
	cmp r3, #0
	bne _080A61F4
	movs r0, #2
	b _080A61F6
_080A61F4:
	subs r0, r3, #1
_080A61F6:
	strb r0, [r4]
	mov r0, ip
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0x40
	beq _080A6214
	ldrb r0, [r4]
	asrs r2, r2, #0x18
	bl SaveMenuModifySaveSlot
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r5, r0
	beq _080A6218
_080A6214:
	movs r0, #1
	b _080A621A
_080A6218:
	movs r0, #0
_080A621A:
	pop {r4, r5}
	pop {r1}
	bx r1

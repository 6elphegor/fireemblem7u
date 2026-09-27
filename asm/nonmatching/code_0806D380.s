	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMuQ4MovementSpeed
GetMuQ4MovementSpeed: @ 0x0806D380
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x4a
	movs r2, #0
	ldrsh r0, [r1, r2]
	str r0, [r7, #4]
	ldr r0, [r7, #4]
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0806D3A6
	ldr r0, [r7, #4]
	adds r1, r0, #0
	adds r1, #0x80
	str r1, [r7, #4]
_0806D3A6:
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x44
	ldrb r0, [r1]
	cmp r0, #0
	beq _0806D3B8
	movs r0, #0x80
	lsls r0, r0, #1
	b _0806D4C2
_0806D3B8:
	ldr r0, [r7, #4]
	cmp r0, #0x40
	bne _0806D3E8
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, _0806D3E4 @ =0x08C9D03C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806D4C2
	.align 2, 0
_0806D3E4: .4byte 0x08C9D03C
_0806D3E8:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806D458
	ldr r0, [r7, #4]
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0806D406
	ldr r0, [r7, #8]
	movs r1, #0x40
	eors r0, r1
	str r0, [r7, #8]
	b _0806D442
_0806D406:
	ldr r1, _0806D434 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D43C
	ldr r1, _0806D438 @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806D432
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806D432:
	b _0806D442
	.align 2, 0
_0806D434: .4byte 0x0202BBF8
_0806D438: .4byte 0x08B857F8
_0806D43C:
	ldr r0, [r7, #4]
	lsls r1, r0, #2
	str r1, [r7, #8]
_0806D442:
	ldr r0, [r7, #8]
	cmp r0, #0x80
	ble _0806D44C
	movs r0, #0x80
	str r0, [r7, #8]
_0806D44C:
	ldr r1, [r7, #8]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	b _0806D4C2
_0806D458:
	bl IsFirstPlaythrough
	cmp r0, #0
	bne _0806D480
	ldr r1, _0806D47C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	movs r2, #1
	adds r0, r1, #0
	ands r0, r2
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806D480
	movs r0, #0x80
	b _0806D4C2
	.align 2, 0
_0806D47C: .4byte 0x08B857F8
_0806D480:
	ldr r1, _0806D4B4 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x40
	ldrb r0, [r1]
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0806D4BE
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r2, [r1]
	adds r0, r2, #0
	bl GetClassData
	ldr r1, _0806D4B8 @ =0x08C9D03C
	ldrb r0, [r0, #7]
	adds r1, r1, r0
	ldrb r2, [r1]
	adds r0, r2, #0
	lsls r1, r0, #4
	adds r2, r1, #0
	lsls r0, r2, #0x10
	lsrs r1, r0, #0x10
	adds r0, r1, #0
	b _0806D4C2
	.align 2, 0
_0806D4B4: .4byte 0x0202BBF8
_0806D4B8: .4byte 0x08C9D03C
_0806D4BC:
	.byte 0x01, 0xE0
_0806D4BE:
	movs r0, #0x40
	b _0806D4C2
_0806D4C2:
	add sp, #0xc
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

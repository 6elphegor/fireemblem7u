	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0454
sub_080B0454: @ 0x080B0454
	push {r7, lr}
	sub sp, #0x1c
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	adds r0, r2, #0
	str r3, [r7, #0xc]
	adds r1, r7, #0
	adds r1, #8
	strb r0, [r1]
	bl EndPlayerPhaseSideWindows
	ldr r0, [r7, #0xc]
	cmp r0, #0
	beq _080B0484
	ldr r0, _080B0480 @ =0x08CE6FC0
	ldr r1, [r7, #0xc]
	bl Proc_StartBlocking
	str r0, [r7, #0x10]
	b _080B0490
	.align 2, 0
_080B0480: .4byte 0x08CE6FC0
_080B0484:
	ldr r1, _080B04C0 @ =0x08CE6FC0
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	str r0, [r7, #0x10]
_080B0490:
	ldr r0, [r7, #0x10]
	adds r1, r7, #0
	adds r1, #8
	adds r2, r0, #0
	adds r0, #0x61
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, [r7, #0x10]
	ldr r1, [r7]
	str r1, [r0, #0x2c]
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _080B04C4
	ldr r0, [r7, #4]
	str r0, [r7, #0x14]
	b _080B04C8
	.align 2, 0
_080B04C0: .4byte 0x08CE6FC0
_080B04C4:
	ldr r0, _080B04D4 @ =0x08CE6F20
	str r0, [r7, #0x14]
_080B04C8:
	movs r0, #0
	str r0, [r7, #0x18]
_080B04CC:
	ldr r0, [r7, #0x18]
	cmp r0, #0x14
	ble _080B04D8
	b _080B0510
	.align 2, 0
_080B04D4: .4byte 0x08CE6F20
_080B04D8:
	adds r0, r7, #0
	adds r0, #0x14
	ldr r1, [r0]
	ldrh r2, [r1]
	adds r1, #2
	str r1, [r0]
	adds r0, r2, #0
	bl MakeNewItem
	ldr r1, [r7, #0x10]
	ldr r2, [r7, #0x18]
	adds r3, r2, #0
	lsls r2, r3, #1
	adds r3, r1, #0
	adds r3, #0x30
	adds r1, r3, r2
	ldrh r2, [r1]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r0
	adds r0, r2, #0
	strh r0, [r1]
	ldr r0, [r7, #0x18]
	adds r1, r0, #1
	str r1, [r7, #0x18]
	b _080B04CC
_080B0510:
	ldr r1, [r7, #0x10]
	adds r0, r1, #0
	bl sub_080B0520
	add sp, #0x1c
	pop {r7}
	pop {r0}
	bx r0

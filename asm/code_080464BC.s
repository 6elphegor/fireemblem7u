	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080464BC
sub_080464BC: @ 0x080464BC
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _080464E0 @ =0x0300141C
	ldr r2, _080464E4 @ =sub_080464A8
	adds r0, r4, #0
	mov r1, sp
	bl SioReceiveData
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08046582
	ldrb r0, [r4]
	cmp r0, #4
	beq _080464E8
	cmp r0, #5
	beq _0804652C
	b _08046582
	.align 2, 0
_080464E0: .4byte 0x0300141C
_080464E4: .4byte sub_080464A8
_080464E8:
	ldrb r0, [r4, #2]
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _0804650C
	ldr r0, _08046508 @ =0x03001420
	ldr r0, [r0, #4]
	bl EndMu
	b _08046514
	.align 2, 0
_08046508: .4byte 0x03001420
_0804650C:
	ldr r0, [r7, #0x34]
	strb r0, [r6, #0x10]
	ldr r0, [r7, #0x38]
	strb r0, [r6, #0x11]
_08046514:
	ldr r0, [r6, #0xc]
	movs r1, #2
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
	bl RefreshUnitSprites
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	b _08046582
_0804652C:
	ldr r4, _08046590 @ =0x03001400
	ldr r5, _08046594 @ =0x0203DC9C
	ldrb r1, [r5, #4]
	adds r0, r1, r4
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r5, [r5, #5]
	adds r4, r5, r4
	ldrb r0, [r4]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r6, #0xc]
	movs r5, #0x80
	lsls r5, r5, #2
	ands r0, r5
	cmp r0, #0
	beq _08046564
	adds r2, r7, #0
	adds r2, #0x2c
	adds r3, r7, #0
	adds r3, #0x30
	adds r0, r6, #0
	movs r1, #0
	bl sub_08046464
_08046564:
	ldr r0, [r4, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0804657C
	adds r2, r7, #0
	adds r2, #0x34
	adds r3, r7, #0
	adds r3, #0x38
	adds r0, r4, #0
	movs r1, #1
	bl sub_08046464
_0804657C:
	adds r0, r7, #0
	bl Proc_Break
_08046582:
	bl sub_080462A4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08046590: .4byte 0x03001400
_08046594: .4byte 0x0203DC9C

	.include "macro.inc"

	.syntax unified

	thumb_func_start FE6Link_Loop
FE6Link_Loop: @ 0x080433F0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	movs r2, #1
	ldr r5, _08043410 @ =0x03004750
	movs r4, #1
	ldr r3, _08043414 @ =0x08B98AEC
_080433FE:
	ldrb r1, [r5, #0x1d]
	asrs r1, r2
	ands r1, r4
	cmp r1, #0
	bne _08043418
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	b _08043434
	.align 2, 0
_08043410: .4byte 0x03004750
_08043414: .4byte 0x08B98AEC
_08043418:
	ldrb r0, [r5, #0x1e]
	asrs r0, r2
	ands r0, r4
	cmp r0, #0
	bne _0804342C
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	strb r4, [r0]
	b _08043436
_0804342C:
	ldr r0, [r3]
	adds r0, #0xb
	adds r0, r0, r2
	movs r1, #3
_08043434:
	strb r1, [r0]
_08043436:
	adds r2, #1
	cmp r2, #3
	ble _080433FE
	adds r0, r7, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r6, r0, #0
	cmp r1, #0
	bne _0804346C
	ldr r0, _08043468 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0804346C
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r7, #0
	movs r1, #0xb
	bl Proc_Goto
	b _080434D6
	.align 2, 0
_08043468: .4byte 0x08B857F8
_0804346C:
	adds r4, r6, #0
	movs r0, #0
	ldrsh r3, [r4, r0]
	cmp r3, #1
	bne _08043490
	ldr r0, _080434E0 @ =0x03004750
	ldr r1, _080434E4 @ =0x030046B0
	ldr r1, [r1]
	adds r1, #0xc0
	ldr r2, _080434E8 @ =0x0300474C
	ldr r2, [r2]
	subs r2, #0xc0
	str r3, [sp]
	movs r3, #4
	bl sub_08049880
	movs r0, #2
	strh r0, [r4]
_08043490:
	ldr r4, _080434E0 @ =0x03004750
	adds r0, r4, #0
	bl sub_08049424
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, #0
	bne _080434C6
	ldrb r0, [r4, #0x18]
	cmp r0, #0
	bne _080434C6
	ldrb r5, [r4, #0x1e]
	cmp r5, #2
	bne _080434C6
	ldr r0, _080434E4 @ =0x030046B0
	ldr r1, [r0]
	adds r1, #0xc0
	ldr r0, _080434E8 @ =0x0300474C
	ldr r2, [r0]
	subs r2, #0xc0
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	movs r3, #4
	bl sub_08049880
	strh r5, [r6]
_080434C6:
	ldr r0, _080434E0 @ =0x03004750
	bl sub_08049944
	cmp r0, #0
	beq _080434D6
	adds r0, r7, #0
	bl Proc_Break
_080434D6:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080434E0: .4byte 0x03004750
_080434E4: .4byte 0x030046B0
_080434E8: .4byte 0x0300474C

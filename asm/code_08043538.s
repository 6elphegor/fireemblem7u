	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08043538
sub_08043538: @ 0x08043538
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _08043584 @ =0x08B98B38
	bl Proc_Find
	cmp r0, #0
	bne _080435C8
	movs r1, #0
	ldr r0, _08043588 @ =0x08B98AEC
	ldr r0, [r0]
	adds r2, r0, #0
	adds r2, #0x1a
_08043552:
	adds r0, r2, r1
	ldrb r0, [r0]
	cmp r0, #0x3c
	bls _0804355C
	adds r4, #1
_0804355C:
	adds r1, #1
	cmp r1, #3
	ble _08043552
	bl sub_0803CD64
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804357A
	ldr r5, _08043588 @ =0x08B98AEC
	ldr r2, [r5]
	ldrb r0, [r2, #0x1e]
	cmp r0, #0x3c
	bhi _0804357A
	cmp r4, #0
	beq _0804358C
_0804357A:
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080435C8
	.align 2, 0
_08043584: .4byte 0x08B98B38
_08043588: .4byte 0x08B98AEC
_0804358C:
	ldr r0, _080435D0 @ =0x030046C0
	movs r1, #0xdc
	strb r1, [r0]
	ldrb r1, [r2, #6]
	strb r1, [r0, #1]
	ldrb r1, [r2]
	strh r1, [r0, #2]
	movs r1, #0xa
	bl sub_0803CE34
	ldr r1, [r5]
	movs r0, #3
	ldrb r2, [r1, #9]
	ands r0, r2
	cmp r0, #3
	bne _080435C8
	strb r0, [r1, #9]
	bl sub_0803D674
	ldr r0, [r5]
	movs r1, #6
	strh r1, [r0, #4]
	movs r1, #0
	strb r1, [r0, #0x1e]
	movs r0, #3
	bl sub_0803D500
	adds r0, r6, #0
	bl Proc_Break
_080435C8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080435D0: .4byte 0x030046C0

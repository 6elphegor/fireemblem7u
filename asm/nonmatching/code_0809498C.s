	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemUseTryMoveHand
PrepItemUseTryMoveHand: @ 0x0809498C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, _080949B8 @ =0x08B857F8
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080949CE
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	ldr r0, [r4, #0x30]
	cmp r0, #0
	ble _080949BC
	subs r0, #1
	str r0, [r4, #0x30]
	b _080949FA
	.align 2, 0
_080949B8: .4byte 0x08B857F8
_080949BC:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094A18
	subs r0, r2, #1
	str r0, [r4, #0x30]
	b _080949FA
_080949CE:
	movs r7, #0x80
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08094A18
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	subs r0, #1
	ldr r1, [r4, #0x30]
	cmp r1, r0
	bge _080949EC
	adds r0, r1, #1
	str r0, [r4, #0x30]
	b _080949FA
_080949EC:
	ldr r1, [r5]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08094A18
	str r6, [r4, #0x30]
_080949FA:
	ldr r0, _08094A10 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08094A0C
	ldr r0, _08094A14 @ =0x00000386
	bl m4aSongNumStart
_08094A0C:
	movs r0, #1
	b _08094A1A
	.align 2, 0
_08094A10: .4byte 0x0202BBF8
_08094A14: .4byte 0x00000386
_08094A18:
	movs r0, #0
_08094A1A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

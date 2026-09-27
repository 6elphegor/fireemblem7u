	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitEffectiveCritRate
ComputeBattleUnitEffectiveCritRate: @ 0x08028D74
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r1, r4, #0
	adds r1, #0x66
	adds r0, r6, #0
	adds r0, #0x68
	ldrh r1, [r1]
	ldrh r0, [r0]
	subs r5, r1, r0
	adds r7, r4, #0
	adds r7, #0x6a
	strh r5, [r7]
	ldr r2, _08028DE8 @ =0x0202BBF8
	adds r1, r2, #0
	adds r1, #0x2b
	movs r0, #1
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08028DD0
	ldrb r0, [r2, #0x1b]
	cmp r0, #1
	beq _08028DD0
	ldr r1, _08028DEC @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028DD0
	movs r0, #0xc0
	ldrb r1, [r6, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08028DD0
	ldrh r2, [r2, #0x2c]
	lsls r0, r2, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08028DCC
	movs r0, #0xa
_08028DCC:
	subs r0, r5, r0
	strh r0, [r7]
_08028DD0:
	adds r0, r4, #0
	adds r0, #0x6a
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r5, r0, #0
	cmp r1, #0
	bge _08028DE2
	movs r0, #0
	strh r0, [r5]
_08028DE2:
	movs r4, #0
	b _08028DF2
	.align 2, 0
_08028DE8: .4byte 0x0202BBF8
_08028DEC: .4byte 0x0202BBB8
_08028DF0:
	adds r4, #1
_08028DF2:
	cmp r4, #4
	bgt _08028E16
	lsls r1, r4, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	cmp r0, #0
	beq _08028E16
	bl GetItemAttributes
	movs r1, #0x80
	lsls r1, r1, #8
	ands r1, r0
	cmp r1, #0
	beq _08028DF0
	movs r0, #0
	strh r0, [r5]
_08028E16:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

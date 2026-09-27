	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitHitRate
ComputeBattleUnitHitRate: @ 0x08028BA0
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemHit
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	lsls r2, r2, #1
	adds r2, r2, r0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	adds r0, r0, r2
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r5, r1, r0
	adds r6, r4, #0
	adds r6, #0x60
	strh r5, [r6]
	ldr r3, _08028C44 @ =0x0202BBF8
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08028C3C
	ldrb r0, [r3, #0x1b]
	cmp r0, #1
	beq _08028C3C
	ldr r1, _08028C48 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028C3C
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08028C3C
	ldr r1, _08028C4C @ =0x081C3AC0
	lsrs r0, r2, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r4]
	ldr r0, [r0]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bne _08028C26
	ldrh r3, [r3, #0x2c]
	lsls r0, r3, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08028C22
	movs r0, #0xa
_08028C22:
	adds r0, r5, r0
	strh r0, [r6]
_08028C26:
	adds r0, r4, #0
	bl sub_08028194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028C3C
	adds r1, r4, #0
	adds r1, #0x60
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_08028C3C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028C44: .4byte 0x0202BBF8
_08028C48: .4byte 0x0202BBB8
_08028C4C: .4byte 0x081C3AC0

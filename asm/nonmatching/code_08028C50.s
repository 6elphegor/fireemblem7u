	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitAvoidRate
ComputeBattleUnitAvoidRate: @ 0x08028C50
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, #0x5e
	movs r2, #0
	ldrsh r1, [r0, r2]
	lsls r1, r1, #1
	subs r0, #7
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r0, r1
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r5, r1, r0
	adds r6, r4, #0
	adds r6, #0x62
	strh r5, [r6]
	ldr r3, _08028CF4 @ =0x0202BBF8
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _08028CDC
	ldrb r0, [r3, #0x1b]
	cmp r0, #1
	beq _08028CDC
	ldr r1, _08028CF8 @ =0x0202BBB8
	movs r0, #0x40
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	bne _08028CDC
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _08028CDC
	ldr r1, _08028CFC @ =0x081C3AC0
	lsrs r0, r2, #4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r4]
	ldr r0, [r0]
	ldrb r1, [r1, #9]
	cmp r0, r1
	bne _08028CC6
	ldrh r3, [r3, #0x2c]
	lsls r0, r3, #0x13
	lsrs r0, r0, #0x17
	movs r1, #0xc
	bl __divsi3
	cmp r0, #0xa
	ble _08028CC2
	movs r0, #0xa
_08028CC2:
	adds r0, r5, r0
	strh r0, [r6]
_08028CC6:
	adds r0, r4, #0
	bl sub_08028194
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08028CDC
	adds r1, r4, #0
	adds r1, #0x62
	ldrh r0, [r1]
	adds r0, #0xa
	strh r0, [r1]
_08028CDC:
	adds r1, r4, #0
	adds r1, #0x62
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bge _08028CEC
	movs r0, #0
	strh r0, [r1]
_08028CEC:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08028CF4: .4byte 0x0202BBF8
_08028CF8: .4byte 0x0202BBB8
_08028CFC: .4byte 0x081C3AC0

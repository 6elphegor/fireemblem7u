	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitKillExpBonus
GetUnitKillExpBonus: @ 0x08029E74
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08029E86
	movs r0, #0
	b _08029F0A
_08029E86:
	movs r6, #0x14
	ldr r1, _08029EB0 @ =0x0202BBF8
	ldrb r0, [r1, #0x1b]
	cmp r0, #1
	beq _08029E9A
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _08029EB4
_08029E9A:
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r6, r0, #0
	adds r6, #0x14
	adds r0, r7, #0
	bl GetUnitPowerLevel
	subs r6, r6, r0
	b _08029EEE
	.align 2, 0
_08029EB0: .4byte 0x0202BBF8
_08029EB4:
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnitPowerLevel
	cmp r4, r0
	bgt _08029EDC
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnitPowerLevel
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	b _08029EEA
_08029EDC:
	adds r0, r5, #0
	bl GetUnitPowerLevel
	adds r4, r0, #0
	adds r0, r7, #0
	bl GetUnitPowerLevel
_08029EEA:
	subs r4, r4, r0
	adds r6, r6, r4
_08029EEE:
	adds r0, r7, #0
	adds r1, r5, #0
	bl GetUnitClassKillExpBonus
	adds r6, r6, r0
	adds r0, r7, #0
	adds r1, r5, #0
	bl GetUnitExpMultiplier
	muls r6, r0, r6
	cmp r6, #0
	bge _08029F08
	movs r6, #0
_08029F08:
	adds r0, r6, #0
_08029F0A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

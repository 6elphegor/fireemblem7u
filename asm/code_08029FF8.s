	.include "macro.inc"

	.syntax unified

	thumb_func_start GetBattleUnitStaffExp
GetBattleUnitStaffExp: @ 0x08029FF8
	push {r4, lr}
	adds r4, r0, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802A00A
	movs r0, #0
	b _0802A056
_0802A00A:
	ldr r1, _0802A01C @ =0x0203A4F0
	movs r0, #2
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0802A020
	movs r0, #1
	b _0802A056
	.align 2, 0
_0802A01C: .4byte 0x0203A4F0
_0802A020:
	adds r0, r4, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCostPerUse
	movs r1, #0x14
	bl __divsi3
	adds r2, r0, #0
	adds r2, #0xa
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0802A04E
	lsrs r0, r2, #0x1f
	adds r0, r2, r0
	asrs r2, r0, #1
_0802A04E:
	cmp r2, #0x64
	ble _0802A054
	movs r2, #0x64
_0802A054:
	adds r0, r2, #0
_0802A056:
	pop {r4}
	pop {r1}
	bx r1

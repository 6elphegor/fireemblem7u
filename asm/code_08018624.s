	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCombinedEnemyWeaponUsabilityBits
GetCombinedEnemyWeaponUsabilityBits: @ 0x08018624
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0x81
	ldr r6, _08018658 @ =0x08B92EB0
_0801862C:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018648
	ldr r0, [r1]
	cmp r0, #0
	beq _08018648
	adds r0, r1, #0
	bl GetUnitWeaponUsabilityBits
	orrs r5, r0
_08018648:
	adds r4, #1
	cmp r4, #0xbf
	ble _0801862C
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018658: .4byte 0x08B92EB0

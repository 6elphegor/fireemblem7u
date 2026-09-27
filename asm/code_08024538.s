	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToHealTargetList
TryAddUnitToHealTargetList: @ 0x08024538
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08024588 @ =0x02033E40
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08024582
	ldr r0, [r5, #0xc]
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08024582
	adds r0, r5, #0
	bl GetUnitCurrentHp
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetUnitMaxHp
	cmp r4, r0
	beq _08024582
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl EnlistTarget
_08024582:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08024588: .4byte 0x02033E40

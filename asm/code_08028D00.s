	.include "macro.inc"

	.syntax unified

	thumb_func_start ComputeBattleUnitCritRate
ComputeBattleUnitCritRate: @ 0x08028D00
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemCrit
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	lsrs r2, r1, #0x1f
	adds r1, r1, r2
	asrs r1, r1, #1
	adds r2, r1, r0
	adds r3, r4, #0
	adds r3, #0x66
	strh r2, [r3]
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08028D36
	adds r0, r2, #0
	adds r0, #0xf
	strh r0, [r3]
_08028D36:
	pop {r4}
	pop {r0}
	bx r0

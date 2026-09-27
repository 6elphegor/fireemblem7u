	.include "macro.inc"

	.syntax unified

	thumb_func_start TryAddUnitToRescueTargetList
TryAddUnitToRescueTargetList: @ 0x08023DD8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08023E34 @ =0x02033E40
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitIdsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023E2C
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #4
	beq _08023E2C
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _08023E2C
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08023E2C
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_08023E2C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08023E34: .4byte 0x02033E40

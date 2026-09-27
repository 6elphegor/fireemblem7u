	.include "macro.inc"

	.syntax unified

	thumb_func_start ListAttackTargetsForWeapon
ListAttackTargetsForWeapon: @ 0x08023C58
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	mov r8, r1
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	movs r6, #0x11
	ldrsb r6, [r0, r6]
	ldr r1, _08023CB4 @ =0x02033E40
	str r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl BeginTargetList
	ldr r0, _08023CB8 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	mov r0, r8
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, r8
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	adds r1, r6, #0
	adds r2, r4, #0
	bl MapAddInBoundedRange
	ldr r0, _08023CBC @ =AddUnitToTargetListIfNotAllied
	bl ForEachUnitInRange
	bl TryAddTrapsToTargetList
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08023CB4: .4byte 0x02033E40
_08023CB8: .4byte 0x0202E3E8
_08023CBC: .4byte AddUnitToTargetListIfNotAllied

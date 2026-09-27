	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFloodMovementAndRange
AiFloodMovementAndRange: @ 0x080389B8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetUnitMovementCost
	bl SetWorkingMoveTable
	ldr r0, _08038A70 @ =0x0202E3E4
	ldr r0, [r0]
	bl SetWorkingBmMap
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl BeginMapFlood
	ldr r0, _08038A74 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _08038A78 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08038A62
_08038A08:
	ldr r0, _08038A78 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sb, r0
	cmp r6, #0
	blt _08038A5C
	lsls r1, r7, #0x10
	mov r8, r1
_08038A1C:
	ldr r0, _08038A70 @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _08038A56
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_08038A56:
	subs r6, #1
	cmp r6, #0
	bge _08038A1C
_08038A5C:
	mov r7, sb
	cmp r7, #0
	bge _08038A08
_08038A62:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038A70: .4byte 0x0202E3E4
_08038A74: .4byte 0x0202E3E8
_08038A78: .4byte 0x0202E3D8

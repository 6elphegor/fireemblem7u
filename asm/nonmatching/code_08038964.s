	.include "macro.inc"

	.syntax unified

	thumb_func_start AiFillReversedAttackRangeMap
AiFillReversedAttackRangeMap: @ 0x08038964
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	lsls r5, r1, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _080389B4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	movs r6, #0x10
	ldrsb r6, [r4, r6]
	ldrb r4, [r4, #0x11]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	mov r8, r4
	adds r0, r5, #0
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r6, #0
	mov r1, r8
	adds r2, r4, #0
	bl MapAddInBoundedRange
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080389B4: .4byte 0x0202E3E8

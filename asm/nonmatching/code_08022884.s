	.include "macro.inc"

	.syntax unified

	thumb_func_start FillBallistaRange
FillBallistaRange: @ 0x08022884
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r0, _08022900 @ =0x0202E3E4
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl BmMapFillg
	ldr r4, _08022904 @ =0x0202E3E8
	ldr r0, [r4]
	movs r1, #0
	bl BmMapFillg
	ldr r0, [r4]
	bl SetWorkingBmMap
	ldr r4, _08022908 @ =0x03004690
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl GetBallistaItemAt
	adds r5, r0, #0
	bl UpdateMenuItemPanel
	ldr r0, [r4]
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r8, r0
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
	movs r0, #2
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08022900: .4byte 0x0202E3E4
_08022904: .4byte 0x0202E3E8
_08022908: .4byte 0x03004690

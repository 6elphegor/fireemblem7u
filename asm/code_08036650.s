	.include "macro.inc"

	.syntax unified

	thumb_func_start AiMakeMoveRangeMapsForUnitAndWeapon
AiMakeMoveRangeMapsForUnitAndWeapon: @ 0x08036650
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sb, r1
	bl RevertMapChange
	ldr r0, _080366E4 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r0, _080366E8 @ =0x0202E3D8
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _080366D4
_0803667A:
	ldr r0, _080366E8 @ =0x0202E3D8
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sl, r0
	cmp r6, #0
	blt _080366CE
	lsls r1, r7, #0x10
	mov r8, r1
_0803668E:
	ldr r0, _080366EC @ =0x0202E3E4
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _080366C8
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sb
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sb
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl MapAddInBoundedRange
_080366C8:
	subs r6, #1
	cmp r6, #0
	bge _0803668E
_080366CE:
	mov r7, sl
	cmp r7, #0
	bge _0803667A
_080366D4:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080366E4: .4byte 0x0202E3E8
_080366E8: .4byte 0x0202E3D8
_080366EC: .4byte 0x0202E3E4

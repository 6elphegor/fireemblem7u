	.include "macro.inc"

	.syntax unified

	thumb_func_start DisplayUnitStandingAttackRange
DisplayUnitStandingAttackRange: @ 0x08021B34
	push {r4, r5, lr}
	ldr r0, _08021B70 @ =0x0202E3E4
	ldr r0, [r0]
	movs r5, #1
	rsbs r5, r5, #0
	adds r1, r5, #0
	bl BmMapFillg
	ldr r0, _08021B74 @ =0x0202E3E8
	ldr r0, [r0]
	movs r1, #0
	bl BmMapFillg
	ldr r4, _08021B78 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08021B7C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r2, #1
	movs r3, #0xa
	bl MapAddInBoundedRange
	b _08021B8C
	.align 2, 0
_08021B70: .4byte 0x0202E3E4
_08021B74: .4byte 0x0202E3E8
_08021B78: .4byte 0x03004690
_08021B7C:
	adds r0, r2, #0
	adds r1, r5, #0
	bl GetUnitWeaponReach
	adds r1, r0, #0
	ldr r0, [r4]
	bl BuildUnitStandingRangeForReach
_08021B8C:
	movs r0, #3
	bl DisplayMoveRangeGraphics
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

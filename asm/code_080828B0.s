	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawHelpBoxWeaponStats
DrawHelpBoxWeaponStats: @ 0x080828B0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08082928 @ =0x0203E6B8
	bl GetWeaponLevelStringFromExp
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemRangeString
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x44
	movs r2, #7
	bl Text_InsertDrawString
	adds r0, r5, #0
	bl GetItemWeight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r4, #8
	adds r0, r5, #0
	bl GetItemMight
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x20
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemHit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x50
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	adds r0, r5, #0
	bl GetItemCrit
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x8c
	movs r2, #7
	bl Text_InsertDrawNumberOrBlank
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082928: .4byte 0x0203E6B8

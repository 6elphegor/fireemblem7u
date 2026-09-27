	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DA14
sub_0807DA14: @ 0x0807DA14
	push {r4, r5, r6, lr}
	movs r0, #9
	bl GetUnitFromCharId
	adds r6, r0, #0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _0807DA5E
_0807DA26:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0807DA46
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeaponNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807DA46
	movs r0, #1
	b _0807DA60
_0807DA46:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #4
	bhi _0807DA5E
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0807DA26
_0807DA5E:
	movs r0, #0
_0807DA60:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

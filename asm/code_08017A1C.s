	.include "macro.inc"

	.syntax unified

	thumb_func_start UnitAutolevelWExp
UnitAutolevelWExp: @ 0x08017A1C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r0, #1
	ldrb r1, [r1, #3]
	ands r0, r1
	cmp r0, #0
	beq _08017AB4
	movs r7, #0
	b _08017AAA
_08017A2E:
	lsls r1, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08017AA8
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08017A62
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017AA8
_08017A62:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08017A7E
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017AA8
_08017A7E:
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _08017ABC @ =0x003D3C00
	ands r1, r0
	cmp r1, #0
	bne _08017AA8
	adds r0, r4, #0
	bl GetItemType
	adds r1, r6, #0
	adds r1, #0x28
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08017AA0
	movs r4, #0
_08017AA0:
	adds r0, r4, #0
	bl GetItemRequiredExp
	strb r0, [r5]
_08017AA8:
	adds r7, #1
_08017AAA:
	adds r0, r6, #0
	bl GetUnitItemCount
	cmp r7, r0
	blt _08017A2E
_08017AB4:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017ABC: .4byte 0x003D3C00

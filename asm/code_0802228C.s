	.include "macro.inc"

	.syntax unified

	thumb_func_start ItemSelectMenu_Usability
ItemSelectMenu_Usability: @ 0x0802228C
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r5, r1, #0
	ldr r7, _080222A8 @ =0x03004690
	ldr r0, [r7]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080222AC
	movs r0, #3
	b _080222D6
	.align 2, 0
_080222A8: .4byte 0x03004690
_080222AC:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _080222C2
	adds r0, r6, #0
	adds r1, r5, #0
	bl WeaponSelectMenu_IsAvailable
_080222C2:
	ldr r0, [r7]
	adds r1, r4, #0
	bl CanUnitUseItem
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080222D4
	movs r1, #1
_080222D4:
	adds r0, r1, #0
_080222D6:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

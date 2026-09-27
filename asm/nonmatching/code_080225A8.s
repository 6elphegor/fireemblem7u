	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080225A8
sub_080225A8: @ 0x080225A8
	push {r4, r5, lr}
	ldr r5, _080225CC @ =0x03004690
	ldr r0, [r5]
	ldr r1, _080225D0 @ =0x0203A85C
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	bne _080225D4
	movs r0, #3
	b _080225E8
	.align 2, 0
_080225CC: .4byte 0x03004690
_080225D0: .4byte 0x0203A85C
_080225D4:
	ldr r0, [r5]
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r1, #2
	cmp r0, #0
	beq _080225E6
	movs r1, #1
_080225E6:
	adds r0, r1, #0
_080225E8:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

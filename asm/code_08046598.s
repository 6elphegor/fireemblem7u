	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046598
sub_08046598: @ 0x08046598
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	movs r5, #0
	ldrh r4, [r6, #0x1e]
	cmp r4, #0
	beq _080465E4
_080465AE:
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080465D0
	adds r0, r4, #0
	bl GetItemMight
	cmp r0, r8
	bls _080465D0
	adds r7, r4, #0
	adds r0, r7, #0
	bl GetItemMight
	mov r8, r0
_080465D0:
	adds r5, #1
	cmp r5, #4
	bgt _080465E4
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _080465AE
_080465E4:
	cmp r7, #0
	beq _080465F2
	adds r0, r6, #0
	bl GetUnitPower
	add r0, r8
	b _080465F4
_080465F2:
	movs r0, #0
_080465F4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

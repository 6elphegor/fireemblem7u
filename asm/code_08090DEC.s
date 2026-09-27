	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckValidLinkArenaItemSwap
CheckValidLinkArenaItemSwap: @ 0x08090DEC
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	cmp r4, r5
	beq _08090E88
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E88
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090E44
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E44
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt _08090E44
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E84
_08090E44:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090E88
	lsls r1, r6, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090E88
	adds r0, r5, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bgt _08090E88
	lsls r1, r7, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090E88
_08090E84:
	movs r0, #0
	b _08090E8A
_08090E88:
	movs r0, #1
_08090E8A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

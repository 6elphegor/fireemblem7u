	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckValidLinkArenaItemSupply
CheckValidLinkArenaItemSupply: @ 0x08090E90
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090EDE
	ldr r0, [r4, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08090EDE
	lsls r1, r5, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r4, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08090EDE
	adds r0, r4, #0
	bl CountUnitUsableWeapons
	cmp r0, #1
	bne _08090EDE
	adds r0, r4, #0
	adds r1, r6, #0
	bl IsWeaponUsable
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08090EDE
	movs r0, #0
	b _08090EE0
_08090EDE:
	movs r0, #1
_08090EE0:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

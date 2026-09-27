	.include "macro.inc"

	.syntax unified

	thumb_func_start HelpBoxPopulateStatScreenWeaponExp
HelpBoxPopulateStatScreenWeaponExp: @ 0x080816BC
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, _080816F4 @ =0x08404B8E
	mov r0, sp
	movs r2, #0x10
	bl memcpy
	ldr r0, [r5, #0x2c]
	ldrh r4, [r0, #0x12]
	ldr r0, _080816F8 @ =0x0200310C
	ldr r0, [r0, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080816E0
	adds r4, #4
_080816E0:
	lsls r0, r4, #1
	add r0, sp
	ldrh r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r1, [r0]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080816F4: .4byte 0x08404B8E
_080816F8: .4byte 0x0200310C

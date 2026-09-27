	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_WeaponLevelGainedPopup
Manim_WeaponLevelGainedPopup: @ 0x0806E3CC
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E420 @ =0x0203A3F0
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponLevelGained
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E3EC
	ldr r0, _0806E420 @ =0x0203A3F0
	str r0, [r7, #4]
_0806E3EC:
	ldr r1, _0806E424 @ =0x0203A470
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponLevelGained
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E400
	ldr r0, _0806E424 @ =0x0203A470
	str r0, [r7, #4]
_0806E400:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806E416
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x50
	ldrb r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_0800EE28
_0806E416:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E420: .4byte 0x0203A3F0
_0806E424: .4byte 0x0203A470

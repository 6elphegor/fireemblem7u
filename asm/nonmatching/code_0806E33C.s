	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_WeaponBrokePopup
Manim_WeaponBrokePopup: @ 0x0806E33C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E390 @ =0x0203A3F0
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponBroke
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E35C
	ldr r0, _0806E390 @ =0x0203A3F0
	str r0, [r7, #4]
_0806E35C:
	ldr r1, _0806E394 @ =0x0203A470
	adds r0, r1, #0
	bl ManimShouldBuDisplayWeaponBroke
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _0806E370
	ldr r0, _0806E394 @ =0x0203A470
	str r0, [r7, #4]
_0806E370:
	ldr r0, [r7, #4]
	cmp r0, #0
	beq _0806E386
	ldr r1, [r7, #4]
	adds r0, r1, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl sub_0800EDE0
_0806E386:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E390: .4byte 0x0203A3F0
_0806E394: .4byte 0x0203A470

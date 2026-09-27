	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_StoleItemPopup
Manim_StoleItemPopup: @ 0x0806E2FC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E314 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x62
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E318
	b _0806E31A
	.align 2, 0
_0806E314: .4byte 0x0203E0FC
_0806E318:
	b _0806E31C
_0806E31A:
	b _0806E32E
_0806E31C:
	ldr r0, _0806E338 @ =0x0203E0FC
	ldr r1, [r0, #0x18]
	adds r0, r1, #0
	adds r1, #0x48
	ldrh r2, [r1]
	adds r0, r2, #0
	ldr r1, [r7]
	bl StartStoleItemPopup
_0806E32E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E338: .4byte 0x0203E0FC

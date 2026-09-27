	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_ShowPoisonEffectIfAny
Manim_ShowPoisonEffectIfAny: @ 0x0806E5F4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _0806E640 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x40
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _0806E636
	ldr r0, _0806E640 @ =0x0203E0FC
	ldr r2, _0806E640 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x59
	ldrb r1, [r2]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartManimPoisonAnim
	ldr r0, [r7]
	movs r1, #0x64
	bl StartTemporaryLock
_0806E636:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E640: .4byte 0x0203E0FC

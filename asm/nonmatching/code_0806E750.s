	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_DisplayDeathFade
Manim_DisplayDeathFade: @ 0x0806E750
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #4]
	ldr r1, _0806E770 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	beq _0806E784
	cmp r0, #2
	beq _0806E774
	b _0806E798
	.align 2, 0
_0806E770: .4byte 0x0203E0FC
_0806E774:
	ldr r1, _0806E794 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x21
	ldrb r0, [r1]
	cmp r0, #0
	bne _0806E784
	movs r0, #1
	str r0, [r7, #4]
_0806E784:
	ldr r0, _0806E794 @ =0x0203E0FC
	ldrb r1, [r0, #0xd]
	cmp r1, #0
	bne _0806E790
	movs r0, #0
	str r0, [r7, #4]
_0806E790:
	b _0806E798
	.align 2, 0
_0806E794: .4byte 0x0203E0FC
_0806E798:
	ldr r0, [r7, #4]
	movs r1, #1
	cmn r0, r1
	beq _0806E7B8
	ldr r0, _0806E7C0 @ =0x0203E0FC
	ldr r1, [r7, #4]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl StartMuDeathFade
_0806E7B8:
	add sp, #8
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E7C0: .4byte 0x0203E0FC

	.include "macro.inc"

	.syntax unified

	thumb_func_start PutStatScreenText
PutStatScreenText: @ 0x0807FA48
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	b _0807FA7C
_0807FA50:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _0807FA72
	ldr r0, [r0]
	bl DecodeMsg
	ldr r5, [r6]
	ldr r1, [r6, #4]
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #9]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl PutDrawText
	b _0807FA7A
_0807FA72:
	ldr r0, [r6]
	ldr r1, [r6, #4]
	bl PutText
_0807FA7A:
	adds r6, #0x10
_0807FA7C:
	ldr r0, [r6]
	cmp r0, #0
	bne _0807FA50
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

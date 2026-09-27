	.include "macro.inc"

	.syntax unified

	thumb_func_start Manim_AdvanceBattleRound
Manim_AdvanceBattleRound: @ 0x0806E4AC
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r1, _0806E588 @ =0x0203E0FC
	ldr r2, [r1, #0x50]
	ldrb r1, [r2, #2]
	lsrs r2, r1, #3
	adds r1, r2, #0
	movs r2, #1
	ands r1, r2
	adds r2, r0, #0
	adds r0, #0x58
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x58
	ldrb r1, [r2]
	movs r2, #1
	subs r1, r2, r1
	adds r2, r0, #0
	adds r0, #0x59
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5a
	ldrh r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrh r1, [r1]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5c
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #2]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r2, _0806E588 @ =0x0203E0FC
	ldr r1, [r2, #0x50]
	adds r2, r0, #0
	adds r0, #0x5d
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	ldrb r1, [r1, #3]
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	ldr r1, _0806E588 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5e
	ldrb r0, [r1]
	cmp r0, #1
	bne _0806E576
	ldr r0, _0806E588 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x58
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, _0806E588 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x59
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
_0806E576:
	ldr r1, _0806E588 @ =0x0203E0FC
	ldr r0, _0806E588 @ =0x0203E0FC
	ldr r1, _0806E588 @ =0x0203E0FC
	ldr r2, [r1, #0x50]
	adds r1, r2, #4
	str r1, [r0, #0x50]
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E588: .4byte 0x0203E0FC

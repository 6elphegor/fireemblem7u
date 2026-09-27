	.include "macro.inc"

	.syntax unified

	thumb_func_start Finial_EventLoadAllies4
Finial_EventLoadAllies4: @ 0x0807E128
	push {r4, r5, r6, r7, lr}
	sub sp, #0x28
	adds r6, r0, #0
	add r2, sp, #0x1c
	adds r1, r2, #0
	ldr r0, _0807E15C @ =0x083FC988
	ldm r0!, {r3, r4, r5}
	stm r1!, {r3, r4, r5}
	adds r1, r6, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E1A2
	ldr r0, _0807E160 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #3
	bne _0807E164
	movs r0, #2
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #1
	b _0807E16E
	.align 2, 0
_0807E15C: .4byte 0x083FC988
_0807E160: .4byte 0x0202BBF8
_0807E164:
	movs r0, #1
	str r0, [sp, #0x10]
	movs r0, #0x2d
	str r0, [sp, #0x14]
	movs r0, #2
_0807E16E:
	str r0, [sp, #0x18]
	adds r4, r2, #0
	add r7, sp, #0x10
	movs r5, #2
_0807E176:
	ldm r7!, {r0}
	movs r2, #0
	ldrsb r2, [r4, r2]
	movs r3, #1
	ldrsb r3, [r4, r3]
	movs r1, #2
	ldrsb r1, [r4, r1]
	str r1, [sp]
	movs r1, #3
	ldrsb r1, [r4, r1]
	str r1, [sp, #4]
	movs r1, #0
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	bl EventLoadUnit
	adds r4, #4
	subs r5, #1
	cmp r5, #0
	bge _0807E176
	bl RefreshUnitSprites
_0807E1A2:
	add sp, #0x28
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

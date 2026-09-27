	.include "macro.inc"

	.syntax unified

	thumb_func_start Finial_EventLoadAllies1
Finial_EventLoadAllies1: @ 0x0807DF24
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r5, r0, #0
	add r0, sp, #0x10
	ldr r1, _0807DFD4 @ =0x083FC960
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	bne _0807DFCC
	add r0, sp, #0x10
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r3, #1
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x27
	movs r1, #0
	bl EventLoadUnit
	add r0, sp, #0x10
	movs r2, #4
	ldrsb r2, [r0, r2]
	movs r3, #5
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #7]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0x26
	movs r1, #0
	bl EventLoadUnit
	ldr r1, _0807DFD8 @ =0x0202BBF8
	adds r1, #0x2b
	movs r4, #1
	adds r0, r4, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0807DFCC
	add r0, sp, #0x10
	movs r2, #8
	ldrsb r2, [r0, r2]
	movs r3, #9
	ldrsb r3, [r0, r3]
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	add r0, sp, #0x10
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	str r4, [sp, #8]
	str r5, [sp, #0xc]
	movs r0, #0xcd
	movs r1, #0x51
	bl EventLoadUnit
_0807DFCC:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807DFD4: .4byte 0x083FC960
_0807DFD8: .4byte 0x0202BBF8

	.include "macro.inc"

	.syntax unified

	thumb_func_start Finial_EventLoadAllies3
Finial_EventLoadAllies3: @ 0x0807E084
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x1c
	mov r8, r0
	movs r7, #0
	add r0, sp, #0x10
	ldr r1, _0807E120 @ =0x083FC97C
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	mov r1, r8
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E114
	movs r6, #1
	mov r5, sp
_0807E0AA:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807E10A
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E10A
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807E10A
	cmp r4, #2
	beq _0807E10A
	cmp r4, #0x2d
	beq _0807E10A
	cmp r4, #0x26
	beq _0807E10A
	cmp r4, #0x27
	beq _0807E10A
	ldr r1, [r1, #0xc]
	ldr r0, _0807E124 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807E10A
	cmp r7, #3
	ble _0807E102
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	movs r0, #2
	ldrsb r0, [r5, r0]
	str r0, [sp]
	movs r0, #3
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	mov r0, r8
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
_0807E102:
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807E110
_0807E10A:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807E0AA
_0807E110:
	bl RefreshUnitSprites
_0807E114:
	add sp, #0x1c
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E120: .4byte 0x083FC97C
_0807E124: .4byte 0x0001000C

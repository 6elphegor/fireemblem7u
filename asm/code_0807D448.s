	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D448
sub_0807D448: @ 0x0807D448
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r2, #0
	movs r6, #0
	movs r4, #1
_0807D458:
	adds r0, r4, #0
	str r2, [sp]
	bl GetUnit
	adds r5, r0, #0
	adds r7, r4, #1
	ldr r2, [sp]
	cmp r5, #0
	beq _0807D4A8
	ldr r0, [r5]
	cmp r0, #0
	beq _0807D4A8
	ldr r0, [r5, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0807D4A8
	lsls r0, r2, #1
	mov r2, r8
	adds r1, r0, r2
	ldrh r0, [r1]
	cmp r0, #0
	beq _0807D4A6
	adds r4, r1, #0
_0807D488:
	ldr r0, [r5]
	ldrh r1, [r4]
	ldrb r0, [r0, #4]
	ldrb r2, [r4]
	cmp r0, r2
	bne _0807D49E
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl PidStatsGetExpGain
	adds r6, r6, r0
_0807D49E:
	adds r4, #2
	ldrh r0, [r4]
	cmp r0, #0
	bne _0807D488
_0807D4A6:
	movs r2, #0
_0807D4A8:
	adds r4, r7, #0
	cmp r4, #0x3f
	ble _0807D458
	lsls r0, r6, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

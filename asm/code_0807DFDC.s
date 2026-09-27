	.include "macro.inc"

	.syntax unified

	thumb_func_start Finial_EventLoadAllies2
Finial_EventLoadAllies2: @ 0x0807DFDC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x20
	adds r7, r0, #0
	movs r0, #0
	mov r8, r0
	add r1, sp, #0x10
	ldr r0, _0807E07C @ =0x083FC96C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	adds r1, r7, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0807E070
	movs r6, #1
	add r5, sp, #0x10
_0807E008:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807E066
	ldr r0, [r1]
	cmp r0, #0
	beq _0807E066
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807E066
	cmp r4, #2
	beq _0807E066
	cmp r4, #0x2d
	beq _0807E066
	cmp r4, #0x26
	beq _0807E066
	cmp r4, #0x27
	beq _0807E066
	ldr r1, [r1, #0xc]
	ldr r0, _0807E080 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807E066
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
	str r7, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	movs r0, #1
	add r8, r0
	mov r2, r8
	cmp r2, #3
	bgt _0807E06C
_0807E066:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807E008
_0807E06C:
	bl RefreshUnitSprites
_0807E070:
	add sp, #0x20
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807E07C: .4byte 0x083FC96C
_0807E080: .4byte 0x0001000C

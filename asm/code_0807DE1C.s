	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807DE1C
sub_0807DE1C: @ 0x0807DE1C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x2c
	add r0, sp, #0x10
	ldr r1, _0807DEA0 @ =0x083FC938
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldm r1!, {r2, r3, r4}
	stm r0!, {r2, r3, r4}
	ldr r1, [r1]
	str r1, [r0]
	movs r7, #0
	movs r6, #1
	add r5, sp, #0x10
_0807DE36:
	adds r0, r6, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0807DE8C
	ldr r0, [r1]
	cmp r0, #0
	beq _0807DE8C
	ldrb r4, [r0, #4]
	cmp r4, #1
	beq _0807DE8C
	cmp r4, #2
	beq _0807DE8C
	cmp r4, #0x2d
	beq _0807DE8C
	cmp r4, #0x26
	beq _0807DE8C
	cmp r4, #0x27
	beq _0807DE8C
	ldr r1, [r1, #0xc]
	ldr r0, _0807DEA4 @ =0x0001000C
	ands r1, r0
	cmp r1, #0
	bne _0807DE8C
	movs r2, #0
	ldrsb r2, [r5, r2]
	movs r3, #1
	ldrsb r3, [r5, r3]
	str r2, [sp]
	movs r0, #1
	ldrsb r0, [r5, r0]
	str r0, [sp, #4]
	str r1, [sp, #8]
	str r1, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #0
	bl EventLoadUnit
	adds r5, #4
	adds r7, #1
	cmp r7, #6
	bgt _0807DE92
_0807DE8C:
	adds r6, #1
	cmp r6, #0x3f
	ble _0807DE36
_0807DE92:
	bl RefreshUnitSprites
	add sp, #0x2c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807DEA0: .4byte 0x083FC938
_0807DEA4: .4byte 0x0001000C

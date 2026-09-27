	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaAdjustOpponentPowerRanking
ArenaAdjustOpponentPowerRanking: @ 0x0802EF5C
	push {r4, r5, r6, lr}
	ldr r4, _0802EF88 @ =0x0203A7F4
	ldr r0, [r4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl ArenaGetPowerRanking
	strh r0, [r4, #0x16]
	ldr r0, [r4, #4]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	bl ArenaGetPowerRanking
	strh r0, [r4, #0x18]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r1, [r4, #0x16]
	cmp r1, r0
	bls _0802EF8C
	ldrh r1, [r4, #0x16]
	b _0802EF8E
	.align 2, 0
_0802EF88: .4byte 0x0203A7F4
_0802EF8C:
	ldrh r1, [r4, #0x18]
_0802EF8E:
	ldr r6, _0802EFAC @ =0x0203A7F4
	ldrh r4, [r6, #0x16]
	ldrh r5, [r6, #0x18]
	subs r2, r4, r5
	cmp r2, #0
	bge _0802EF9C
	subs r2, r5, r4
_0802EF9C:
	movs r0, #0x64
	muls r0, r2, r0
	bl __divsi3
	cmp r0, #0x14
	bgt _0802EFB0
	movs r0, #0
	b _0802F0A6
	.align 2, 0
_0802EFAC: .4byte 0x0203A7F4
_0802EFB0:
	cmp r4, r5
	bhs _0802F02C
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFCC
	subs r0, r2, #1
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	subs r0, #1
	strb r0, [r1, #0x13]
_0802EFCC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFDC
	subs r0, r2, #1
	strb r0, [r1, #0x14]
_0802EFDC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFEC
	subs r0, r2, #1
	strb r0, [r1, #0x15]
_0802EFEC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802EFFC
	subs r0, r2, #1
	strb r0, [r1, #0x16]
_0802EFFC:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F00C
	subs r0, r2, #1
	strb r0, [r1, #0x17]
_0802F00C:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F01C
	subs r0, r2, #1
	strb r0, [r1, #0x18]
_0802F01C:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802F0A4
	subs r0, r2, #1
	b _0802F0A2
_0802F02C:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x12]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0x4f
	bgt _0802F044
	adds r0, r2, #2
	strb r0, [r1, #0x12]
	ldr r1, [r6, #4]
	ldrb r0, [r1, #0x13]
	adds r0, #2
	strb r0, [r1, #0x13]
_0802F044:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x14]
	movs r0, #0x14
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F054
	adds r0, r2, #1
	strb r0, [r1, #0x14]
_0802F054:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x15]
	movs r0, #0x15
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F064
	adds r0, r2, #1
	strb r0, [r1, #0x15]
_0802F064:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x16]
	movs r0, #0x16
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F074
	adds r0, r2, #1
	strb r0, [r1, #0x16]
_0802F074:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x17]
	movs r0, #0x17
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F084
	adds r0, r2, #1
	strb r0, [r1, #0x17]
_0802F084:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x18]
	movs r0, #0x18
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F094
	adds r0, r2, #1
	strb r0, [r1, #0x18]
_0802F094:
	ldr r1, [r6, #4]
	ldrb r2, [r1, #0x19]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	cmp r0, #0x1d
	bgt _0802F0A4
	adds r0, r2, #1
_0802F0A2:
	strb r0, [r1, #0x19]
_0802F0A4:
	movs r0, #1
_0802F0A6:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaGenerateOpponentUnit
ArenaGenerateOpponentUnit: @ 0x0802EC88
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r6, _0802ED04 @ =0x0203A814
	mov r1, sp
	movs r2, #0
	movs r0, #0xfb
	strb r0, [r1]
	ldr r5, _0802ED08 @ =0x0203A7F4
	ldrb r0, [r5, #0x10]
	strb r0, [r1, #1]
	mov r3, sp
	ldrb r0, [r3, #3]
	movs r1, #7
	rsbs r1, r1, #0
	ands r1, r0
	strb r1, [r3, #3]
	mov r4, sp
	ldrb r5, [r5, #0x12]
	lsls r3, r5, #3
	movs r0, #7
	ands r0, r1
	orrs r0, r3
	strb r0, [r4, #3]
	mov r3, sp
	movs r1, #1
	orrs r0, r1
	strb r0, [r3, #3]
	mov r0, sp
	strb r2, [r0, #8]
	strb r2, [r0, #9]
	strb r2, [r0, #0xa]
	strb r2, [r0, #0xb]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xc]
	strb r2, [r0, #0xd]
	strb r2, [r0, #0xe]
	strb r2, [r0, #0xf]
	adds r0, r6, #0
	bl ClearUnit
	movs r0, #0x80
	strb r0, [r6, #0xb]
	adds r0, r6, #0
	mov r1, sp
	bl UnitInitFromDefinition
	ldr r1, [r6]
	adds r0, r6, #0
	bl UnitLoadStatsFromChracter
	movs r4, #8
	ldrsb r4, [r6, r4]
	ldr r1, _0802ED0C @ =0x0202BBF8
	movs r0, #0x40
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	beq _0802ED10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #3
	b _0802ED16
	.align 2, 0
_0802ED04: .4byte 0x0203A814
_0802ED08: .4byte 0x0203A7F4
_0802ED0C: .4byte 0x0202BBF8
_0802ED10:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
_0802ED16:
	movs r1, #0xa
	bl __divsi3
	strb r0, [r6, #8]
	adds r0, r6, #0
	bl UnitAutolevel
	strb r4, [r6, #8]
	movs r2, #0
	adds r3, r6, #0
	adds r3, #0x28
	movs r4, #0xb5
_0802ED2E:
	adds r1, r3, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _0802ED38
	strb r4, [r1]
_0802ED38:
	adds r2, #1
	cmp r2, #7
	ble _0802ED2E
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bgt _0802ED4A
	movs r0, #1
	strb r0, [r6, #8]
_0802ED4A:
	movs r0, #8
	ldrsb r0, [r6, r0]
	cmp r0, #0x14
	ble _0802ED56
	movs r0, #0x14
	strb r0, [r6, #8]
_0802ED56:
	adds r0, r6, #0
	bl UnitCheckStatCaps
	adds r0, r6, #0
	bl GetUnitMaxHp
	adds r1, r0, #0
	adds r0, r6, #0
	bl SetUnitHp
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

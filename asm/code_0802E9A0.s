	.include "macro.inc"

	.syntax unified

	thumb_func_start ArenaBeginInternal
ArenaBeginInternal: @ 0x0802E9A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0802EA04 @ =0x0203A7F4
	str r4, [r5]
	ldr r0, _0802EA08 @ =0x0203A814
	str r0, [r5, #4]
	ldr r2, _0802EA0C @ =0x03002850
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	strb r0, [r5, #0xf]
	adds r0, r4, #0
	bl GetUnitBestWRankType
	strb r0, [r5, #0xd]
	ldrb r0, [r5, #0xd]
	bl ArenaGenerateOpposingClassId
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x10]
	bl GetClassData
	bl GetClassBestWRankType
	strb r0, [r5, #0xe]
	ldrb r0, [r5, #0xd]
	bl IsWeaponMagic
	strb r0, [r5, #0x13]
	ldrb r0, [r5, #0xe]
	bl IsWeaponMagic
	strb r0, [r5, #0x14]
	ldrb r0, [r4, #8]
	strb r0, [r5, #0x11]
	ldr r0, [r4, #0xc]
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	cmp r0, #4
	bhi _0802EA10
	ldrb r0, [r5, #0x11]
	bl ArenaGetOpposingLevel
	b _0802EA18
	.align 2, 0
_0802EA04: .4byte 0x0203A7F4
_0802EA08: .4byte 0x0203A814
_0802EA0C: .4byte 0x03002850
_0802EA10:
	ldrb r0, [r5, #0x11]
	bl ArenaGetOpposingLevel
	adds r0, #7
_0802EA18:
	strb r0, [r5, #0x12]
	bl ArenaGenerateOpponentUnit
	bl ArenaGenerateBaseWeapons
	movs r4, #0
	b _0802EA28
_0802EA26:
	adds r4, #1
_0802EA28:
	cmp r4, #9
	bgt _0802EA36
	bl ArenaAdjustOpponentPowerRanking
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA26
_0802EA36:
	movs r4, #0
	b _0802EA3C
_0802EA3A:
	adds r4, #1
_0802EA3C:
	cmp r4, #4
	bgt _0802EA4A
	bl ArenaAdjustOpponentDamage
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EA3A
_0802EA4A:
	ldr r4, _0802EA7C @ =0x0203A7F4
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
	bl ArenaGenerateMatchupGoldValue
	movs r0, #1
	strb r0, [r4, #0xb]
	movs r0, #0
	bl ArenaSetResult
	bl ArenaSetFallbackWeaponsMaybe
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EA7C: .4byte 0x0203A7F4

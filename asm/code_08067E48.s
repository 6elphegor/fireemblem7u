	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrPlayMainBGM
EkrPlayMainBGM: @ 0x08067E48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _08067E94 @ =0x0203E094
	ldr r1, _08067E98 @ =0x0203E098
	ldr r5, [r0]
	ldr r6, [r1]
	ldr r1, _08067E9C @ =0x0202BBB8
	movs r0, #0x20
	ldrb r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _08067E64
	b _080680C8
_08067E64:
	ldr r1, _08067EA0 @ =0x020200A0
	movs r0, #1
	str r0, [r1]
	ldr r1, _08067EA4 @ =0x0203E020
	ldr r0, _08067EA8 @ =0x0203E00C
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0x20
	mov r8, r1
	ldrh r0, [r0]
	cmp r0, #1
	beq _08067E84
	movs r2, #0x1f
	mov r8, r2
_08067E84:
	bl GetBattleAnimArenaFlag
	cmp r0, #1
	bne _08067EAC
	bl sub_08003F6C
	b _08067EB4
	.align 2, 0
_08067E94: .4byte 0x0203E094
_08067E98: .4byte 0x0203E098
_08067E9C: .4byte 0x0202BBB8
_08067EA0: .4byte 0x020200A0
_08067EA4: .4byte 0x0203E020
_08067EA8: .4byte 0x0203E00C
_08067EAC:
	bl GetBanimLinkArenaFlag
	cmp r0, #1
	bne _08067EC0
_08067EB4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x48
	bl EfxOverrideBgm
	b _080680CE
_08067EC0:
	ldr r0, _08067ED4 @ =0x0203E02C
	ldrh r0, [r0]
	cmp r0, #4
	bne _08067ED8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1b
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067ED4: .4byte 0x0203E02C
_08067ED8:
	ldr r7, _08067F54 @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r7, r1]
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	ldr r0, _08067F58 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	cmp r0, #0x3e
	beq _08067EEE
	movs r4, #0
_08067EEE:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	beq _08067EF8
	movs r4, #0
_08067EF8:
	ldr r0, [r6]
	ldrb r0, [r0, #4]
	cmp r0, #0x27
	beq _08067F02
	movs r4, #0
_08067F02:
	cmp r4, #1
	beq _08067F48
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl IsWeaponLegency
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08067F1C
	movs r4, #1
_08067F1C:
	movs r0, #1
	bl EkrCheckAttackRound
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08067F2A
	movs r4, #0
_08067F2A:
	movs r2, #0
	ldrsh r0, [r7, r2]
	cmp r0, #0
	bne _08067F34
	movs r4, #0
_08067F34:
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #0x44
	bne _08067F3E
	movs r4, #0
_08067F3E:
	cmp r0, #0x86
	bne _08067F44
	movs r4, #0
_08067F44:
	cmp r4, #1
	bne _08067F5C
_08067F48:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1c
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067F54: .4byte 0x0203E010
_08067F58: .4byte 0x0202BBF8
_08067F5C:
	cmp r0, #0x86
	bne _08067F7C
	bl sub_08079A9C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08067F78
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x6f
	bl EfxOverrideBgm
	b _080680CE
_08067F78:
	bl sub_08079A90
_08067F7C:
	adds r0, r5, #0
	bl GetBanimBossBGM
	adds r4, r0, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl GetUnitFromCharId
	movs r1, #0xc0
	ldrb r0, [r0, #0xb]
	ands r1, r0
	cmp r1, #0
	bne _08067F9A
	movs r4, #1
	rsbs r4, r4, #0
_08067F9A:
	ldr r0, _08067FBC @ =0x0203E010
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08067FA8
	movs r4, #1
	rsbs r4, r4, #0
_08067FA8:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _08067FC0
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067FBC: .4byte 0x0203E010
_08067FC0:
	movs r4, #0
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08067FEA
	ldr r0, _08067FFC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x2e
	bne _08067FE4
	movs r4, #1
_08067FE4:
	cmp r0, #0x2f
	bne _08067FEA
	movs r4, #1
_08067FEA:
	cmp r4, #1
	bne _08068000
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x14
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08067FFC: .4byte 0x0202BBF8
_08068000:
	movs r4, #0
	ldr r0, [r6, #4]
	ldrb r1, [r0, #4]
	adds r3, r0, #0
	cmp r1, #0x40
	bne _08068024
	ldr r0, _08068034 @ =0x0203A3D8
	ldrh r2, [r0]
	ands r1, r2
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r2
	cmp r0, #0
	beq _08068024
	movs r4, #1
_08068024:
	cmp r4, #1
	bne _08068038
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1d
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_08068034: .4byte 0x0203A3D8
_08068038:
	movs r4, #0
	ldrb r3, [r3, #4]
	cmp r3, #0x41
	bne _0806805C
	ldr r0, _0806806C @ =0x0203A3D8
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	rsbs r0, r0, #0
	lsrs r4, r0, #0x1f
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806805C
	movs r4, #1
_0806805C:
	cmp r4, #1
	bne _08068070
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0x1e
	bl EfxOverrideBgm
	b _080680CE
	.align 2, 0
_0806806C: .4byte 0x0203A3D8
_08068070:
	movs r0, #0
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _08068084
	ldr r0, _08068080 @ =0x0203A3F0
	b _08068090
	.align 2, 0
_08068080: .4byte 0x0203A3F0
_08068084:
	movs r0, #1
	bl EfxCheckRetaliation
	cmp r0, #1
	bne _080680A0
	ldr r0, _0806809C @ =0x0203A470
_08068090:
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetEfxHpChangeType
	b _080680A2
	.align 2, 0
_0806809C: .4byte 0x0203A470
_080680A0:
	movs r0, #0
_080680A2:
	cmp r0, #1
	beq _080680B0
	cmp r0, #2
	bne _080680B4
	movs r2, #0x1a
	mov r8, r2
	b _080680B4
_080680B0:
	movs r0, #0x19
	mov r8, r0
_080680B4:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _080680C8
	movs r1, #0x80
	lsls r1, r1, #1
	mov r0, r8
	bl EfxOverrideBgm
	b _080680CE
_080680C8:
	ldr r1, _080680D8 @ =0x020200A0
	movs r0, #0
	str r0, [r1]
_080680CE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080680D8: .4byte 0x020200A0

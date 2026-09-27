	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807FDF0
sub_0807FDF0: @ 0x0807FDF0
	push {r4, r5, r6, lr}
	sub sp, #8
	ldr r0, _0807FE40 @ =0x083FCA4C
	ldr r4, _0807FE44 @ =0x02020140
	adds r1, r4, #0
	bl Decompress
	ldr r0, _0807FE48 @ =0x0200373C
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl TmApplyTsa_thm
	ldr r0, _0807FE4C @ =0x084049A0
	bl DisplayTexts
	ldr r5, _0807FE50 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	beq _0807FE5C
	ldr r0, _0807FE54 @ =0x000010F9
	bl DecodeMsg
	adds r3, r5, #0
	adds r3, #0x30
	ldr r1, _0807FE58 @ =0x0200327E
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
	b _0807FE76
	.align 2, 0
_0807FE40: .4byte 0x083FCA4C
_0807FE44: .4byte 0x02020140
_0807FE48: .4byte 0x0200373C
_0807FE4C: .4byte 0x084049A0
_0807FE50: .4byte 0x0200310C
_0807FE54: .4byte 0x000010F9
_0807FE58: .4byte 0x0200327E
_0807FE5C:
	ldr r0, _08080048 @ =0x000010F8
	bl DecodeMsg
	adds r2, r5, #0
	adds r2, #0x30
	ldr r1, _0808004C @ =0x0200327E
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #3
	movs r3, #0
	bl PutDrawText
_0807FE76:
	ldr r6, _08080050 @ =0x0200310C
	ldr r0, [r6, #0xc]
	bl GetUnitPower
	ldr r1, [r6, #0xc]
	movs r3, #0x14
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #0
	movs r1, #5
	movs r2, #1
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSkill
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x15]
	ldr r0, [r2, #0xc]
	movs r5, #0x10
	ands r0, r5
	cmp r0, #0
	beq _0807FEBA
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FEBA:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x15]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FED6
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FED6:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #1
	movs r1, #5
	movs r2, #3
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitSpeed
	adds r4, r0, #0
	ldr r2, [r6, #0xc]
	ldrb r1, [r2, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FF04
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FF04:
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	str r4, [sp]
	ldr r0, [r2, #4]
	ldrb r1, [r0, #0x16]
	ldr r0, [r2, #0xc]
	ands r0, r5
	cmp r0, #0
	beq _0807FF20
	lsls r0, r1, #0x18
	asrs r1, r0, #0x18
	lsrs r0, r0, #0x1f
	adds r1, r1, r0
	lsrs r1, r1, #1
_0807FF20:
	lsls r0, r1, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #2
	movs r1, #5
	movs r2, #5
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitLuck
	ldr r1, [r6, #0xc]
	movs r3, #0x19
	ldrsb r3, [r1, r3]
	str r0, [sp]
	movs r0, #0x1e
	str r0, [sp, #4]
	movs r0, #3
	movs r1, #5
	movs r2, #7
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitDefense
	ldr r1, [r6, #0xc]
	movs r3, #0x17
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #4
	movs r1, #5
	movs r2, #9
	bl PutStatScreenStatWithBar
	ldr r0, [r6, #0xc]
	bl GetUnitResistance
	ldr r1, [r6, #0xc]
	movs r3, #0x18
	ldrsb r3, [r1, r3]
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #5
	movs r1, #5
	movs r2, #0xb
	bl PutStatScreenStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x12
	ldrsb r3, [r0, r3]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	adds r0, r0, r3
	str r0, [sp]
	movs r5, #0xf
	str r5, [sp, #4]
	movs r0, #6
	movs r1, #0xd
	movs r2, #1
	bl PutStatScreenStatWithBar
	ldr r1, [r6, #0xc]
	ldr r0, [r1, #4]
	movs r3, #0x11
	ldrsb r3, [r0, r3]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r3, r3, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r0, r3, r0
	str r0, [sp]
	ldr r0, [r1, #4]
	ldrb r0, [r0, #0x19]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #4]
	movs r0, #7
	movs r1, #0xd
	movs r2, #3
	bl PutStatScreenStatWithBar
	ldr r4, _08080054 @ =0x02003396
	ldr r0, [r6, #0xc]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	adds r4, #2
	ldr r0, [r6, #0xc]
	ldr r1, [r0]
	ldr r2, [r0, #4]
	ldr r0, [r1, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	bl GetUnitAidIconId
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	adds r4, r6, #0
	adds r4, #0x78
	ldr r0, [r6, #0xc]
	bl GetUnitRescueName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
	ldr r1, [r6, #0xc]
	adds r0, r1, #0
	adds r0, #0x30
	ldrb r0, [r0]
	ands r5, r0
	cmp r5, #4
	bne _08080058
	adds r4, #0x10
	adds r0, r1, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #2
	bl Text_InsertDrawString
	b _0808006E
	.align 2, 0
_08080048: .4byte 0x000010F8
_0808004C: .4byte 0x0200327E
_08080050: .4byte 0x0200310C
_08080054: .4byte 0x02003396
_08080058:
	adds r4, r6, #0
	adds r4, #0x88
	adds r0, r1, #0
	bl GetUnitStatusName
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x18
	movs r2, #2
	bl Text_InsertDrawString
_0808006E:
	ldr r5, _080800A8 @ =0x0200310C
	ldr r0, [r5, #0xc]
	adds r0, #0x30
	ldrb r2, [r0]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	beq _08080088
	ldr r0, _080800AC @ =0x0200351C
	lsrs r2, r2, #4
	movs r1, #0
	bl PutNumberSmall
_08080088:
	ldr r4, _080800B0 @ =0x02003496
	ldr r0, [r5, #0xc]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	bl sub_0807FBF0
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080800A8: .4byte 0x0200310C
_080800AC: .4byte 0x0200351C
_080800B0: .4byte 0x02003496

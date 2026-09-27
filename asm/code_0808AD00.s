	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808AD00
sub_0808AD00: @ 0x0808AD00
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, _0808AD9C @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sb, r0
	cmp r4, #0
	beq _0808ADDA
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, _0808ADA0 @ =0x0200D570
	adds r5, r4, r0
	adds r0, r5, #0
	bl ClearText
	adds r0, r5, #0
	movs r1, #0
	bl Text_SetCursor
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _0808ADA4
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0808ADA4
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl IsCharacterForceDeployed
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808ADA4
	adds r0, r5, #0
	movs r1, #4
	bl Text_SetColor
	b _0808ADAE
	.align 2, 0
_0808AD9C: .4byte 0x0200CBF0
_0808ADA0: .4byte 0x0200D570
_0808ADA4:
	ldr r0, _0808AE24 @ =0x0200D570
	add r0, r8
	mov r1, sb
	bl Text_SetColor
_0808ADAE:
	ldr r4, _0808AE24 @ =0x0200D570
	add r4, r8
	ldr r1, _0808AE28 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r1, r0, #0
	adds r0, r4, #0
	bl Text_DrawString
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl PutText
_0808ADDA:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, _0808AE2C @ =0x0200D5A8
	adds r0, r0, r6
	bl ClearText
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl ClearText
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls _0808AE1A
	b _0808B448
_0808AE1A:
	lsls r0, r2, #2
	ldr r1, _0808AE30 @ =_0808AE34
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0808AE24: .4byte 0x0200D570
_0808AE28: .4byte 0x0200CBF0
_0808AE2C: .4byte 0x0200D5A8
_0808AE30: .4byte _0808AE34
_0808AE34: @ jump table
	.4byte _0808AE4C @ case 0
	.4byte _0808AFC0 @ case 1
	.4byte _0808B084 @ case 2
	.4byte _0808B1A2 @ case 3
	.4byte _0808B2B8 @ case 4
	.4byte _0808B3E8 @ case 5
_0808AE4C:
	ldr r0, _0808AEC0 @ =0x0200CBF0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, _0808AEC4 @ =0x0200D5A8
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl PutDrawText
	adds r4, #8
	adds r5, r5, r4
	mov r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl Text_SetColor
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne _0808AECC
	ldr r0, _0808AEC8 @ =0x0000127F
	bl DecodeMsg
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	b _0808AF2A
	.align 2, 0
_0808AEC0: .4byte 0x0200CBF0
_0808AEC4: .4byte 0x0200D5A8
_0808AEC8: .4byte 0x0000127F
_0808AECC:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl PutDrawText
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl sub_08088D8C
_0808AF2A:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, _0808AF60 @ =0x0200D5B8
	adds r5, r0, r1
	adds r0, r5, #0
	bl ClearText
	ldr r0, _0808AF64 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq _0808AF72
	cmp r4, r0
	bhi _0808AF68
	cmp r4, #0
	beq _0808AFA0
	b _0808B5B6
	.align 2, 0
_0808AF60: .4byte 0x0200D5B8
_0808AF64: .4byte 0x0200CBF0
_0808AF68:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq _0808AF7C
	b _0808B5B6
_0808AF72:
	ldr r0, _0808AF78 @ =0x00001274
	b _0808AF7E
	.align 2, 0
_0808AF78: .4byte 0x00001274
_0808AF7C:
	ldr r0, _0808AF9C @ =0x00001275
_0808AF7E:
	bl DecodeMsg
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl PutDrawText
	b _0808B5B6
	.align 2, 0
_0808AF9C: .4byte 0x00001275
_0808AFA0:
	ldr r0, _0808AFBC @ =0x00001276
	bl DecodeMsg
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl PutDrawText
	b _0808B5B6
	.align 2, 0
_0808AFBC: .4byte 0x00001276
_0808AFC0:
	ldr r1, _0808B07C @ =0x0200CBF0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808B080 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x10
	mov r8, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #0
	bl PutDrawText
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B006
	movs r1, #1
_0808B006:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r4, #0
	adds r3, #0x28
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _0808B022
	movs r1, #1
_0808B022:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r5, r4, #0
	adds r5, #0x2e
	movs r7, #2
	mov r3, sb
	cmp r3, #0
	beq _0808B03C
	movs r7, #1
_0808B03C:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #0x34
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B066
	movs r5, #1
_0808B066:
	ldr r0, [r6]
	ldr r0, [r0]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	b _0808B5B6
	.align 2, 0
_0808B07C: .4byte 0x0200CBF0
_0808B080: .4byte 0x0200D5A8
_0808B084:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r1, #0x12
	adds r1, r1, r5
	mov r8, r1
	ldr r1, _0808B190 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x14]
	ldrb r2, [r1, #0x14]
	cmp r0, r2
	bne _0808B0A6
	movs r6, #4
_0808B0A6:
	adds r0, r1, #0
	bl GetUnitPower
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x15]
	ldrb r3, [r1, #0x15]
	cmp r0, r3
	bne _0808B0CC
	movs r6, #4
_0808B0CC:
	adds r0, r1, #0
	bl GetUnitSkill
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x16]
	ldrb r2, [r1, #0x16]
	cmp r0, r2
	bne _0808B0F2
	movs r6, #4
_0808B0F2:
	adds r0, r1, #0
	bl GetUnitSpeed
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r0, [r0]
	movs r6, #2
	ldrb r3, [r0, #0x19]
	cmp r3, #0x1e
	bne _0808B114
	movs r6, #4
_0808B114:
	bl GetUnitLuck
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x17]
	ldrb r2, [r1, #0x17]
	cmp r0, r2
	bne _0808B138
	movs r6, #4
_0808B138:
	adds r0, r1, #0
	bl GetUnitDefense
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r6, #2
	ldrb r0, [r0, #0x18]
	ldrb r3, [r1, #0x18]
	cmp r0, r3
	bne _0808B15E
	movs r6, #4
_0808B15E:
	adds r0, r1, #0
	bl GetUnitResistance
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0808B194
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _0808B5B6
	.align 2, 0
_0808B190: .4byte 0x0200CBF0
_0808B194:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl PutIcon
	b _0808B5B6
_0808B1A2:
	ldr r0, _0808B1E4 @ =0x0200CBF0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r5, #0
	bne _0808B1F0
	ldr r0, _0808B1E8 @ =0x0000127F
	bl DecodeMsg
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808B1EC @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, sb
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
	b _0808B254
	.align 2, 0
_0808B1E4: .4byte 0x0200CBF0
_0808B1E8: .4byte 0x0000127F
_0808B1EC: .4byte 0x0200D5A8
_0808B1F0:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemName
	adds r5, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _0808B2B0 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, sb
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl PutIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl sub_08088D8C
_0808B254:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808B266
	movs r1, #1
_0808B266:
	ldr r0, _0808B2B4 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B286
	movs r1, #1
_0808B286:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B2A0
	movs r3, #1
_0808B2A0:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl PutNumberOrBlank
	b _0808B5B6
	.align 2, 0
_0808B2B0: .4byte 0x0200D5A8
_0808B2B4: .4byte 0x0200CBF0
_0808B2B8:
	ldr r0, _0808B2F8 @ =0x0200CBF0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r5, [r2, #0xc]
	movs r0, #0x10
	ands r5, r0
	str r1, [sp, #0x4c]
	cmp r5, #0
	beq _0808B300
	adds r0, r2, #0
	bl sub_08018CC0
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _0808B2FC @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl PutDrawText
	b _0808B328
	.align 2, 0
_0808B2F8: .4byte 0x0200CBF0
_0808B2FC: .4byte 0x0200D5B0
_0808B300:
	ldr r0, _0808B3D8 @ =0x0000127D
	bl DecodeMsg
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _0808B3DC @ =0x0200D5B0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl PutDrawText
_0808B328:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _0808B33C
	movs r1, #1
_0808B33C:
	ldr r0, _0808B3E0 @ =0x0200CBF0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0808B368
	movs r5, #1
_0808B368:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, sb
	cmp r1, #0
	beq _0808B398
	movs r6, #1
_0808B398:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitStatusName
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, _0808B3E4 @ =0x0200D5A8
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, sb
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	bl PutDrawText
	b _0808B5B6
	.align 2, 0
_0808B3D8: .4byte 0x0000127D
_0808B3DC: .4byte 0x0200D5B0
_0808B3E0: .4byte 0x0200CBF0
_0808B3E4: .4byte 0x0200D5A8
_0808B3E8:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _0808B440 @ =0x0200CBF0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
_0808B3F4:
	add r1, sp, #8
	ldr r0, _0808B444 @ =0x0840F358
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne _0808B424
	movs r1, #4
_0808B424:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl PutSpecialChar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _0808B3F4
	b _0808B5B6
	.align 2, 0
_0808B440: .4byte 0x0200CBF0
_0808B444: .4byte 0x0840F358
_0808B448:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, _0808B500 @ =0x0200CBF0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupporterCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl ClearText
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	bge _0808B56E
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, sb
	rsbs r3, r3, #0
	mov r0, sb
	orrs r3, r0
	mov r8, r3
_0808B490:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808B562
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	blo _0808B558
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportUnit
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _0808B508
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808B504 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl PutDrawText
	b _0808B546
	.align 2, 0
_0808B500: .4byte 0x0200CBF0
_0808B504: .4byte 0x0200D5A8
_0808B508:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupportPid
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl DecodeMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808B554 @ =0x0200D5A8
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl PutDrawText
_0808B546:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _0808B56E
	b _0808B562
	.align 2, 0
_0808B554: .4byte 0x0200D5A8
_0808B558:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_0808B562:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt _0808B490
_0808B56E:
	cmp r4, #2
	bhi _0808B5B6
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, sb
	rsbs r6, r2, #0
	orrs r6, r2
_0808B584:
	ldr r0, _0808B5CC @ =0x0000127D
	bl DecodeMsg
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _0808B5D0 @ =0x0200D5A8
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl PutDrawText
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _0808B584
_0808B5B6:
	movs r0, #1
	bl EnableBgSync
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808B5CC: .4byte 0x0000127D
_0808B5D0: .4byte 0x0200D5A8

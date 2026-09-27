	.include "macro.inc"

	.syntax unified

	thumb_func_start PutStatScreenLeftPanelInfo
PutStatScreenLeftPanelInfo: @ 0x0807FA8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	ldr r7, _0807FB70 @ =0x0200310C
	ldr r0, [r7, #0xc]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r5, r0, #0
	movs r0, #0x38
	adds r1, r5, #0
	bl GetStringTextCenteredPos
	adds r6, r0, #0
	ldr r0, _0807FB74 @ =0x02022C60
	mov r8, r0
	movs r1, #0
	bl TmFill
	ldr r4, [r7, #0xc]
	adds r0, r4, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl BattleGenerateUiStats
	adds r0, r7, #0
	adds r0, #0x18
	movs r1, #0xa2
	lsls r1, r1, #2
	add r1, r8
	movs r4, #0
	str r4, [sp]
	str r5, [sp, #4]
	movs r2, #0
	adds r3, r6, #0
	bl PutDrawText
	ldr r0, [r7, #0xc]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl DecodeMsg
	adds r2, r7, #0
	adds r2, #0x20
	ldr r1, _0807FB78 @ =0x00000342
	add r1, r8
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r2, #0
	movs r2, #0
	movs r3, #0
	bl PutDrawText
	ldr r0, _0807FB7C @ =0x000003C2
	add r0, r8
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	ldr r0, _0807FB80 @ =0x000003CA
	add r0, r8
	movs r1, #3
	movs r2, #0x1f
	bl PutSpecialChar
	ldr r0, _0807FB84 @ =0x00000442
	add r0, r8
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	ldr r0, _0807FB88 @ =0x0000044A
	add r0, r8
	movs r1, #3
	movs r2, #0x16
	bl PutSpecialChar
	movs r0, #0xf2
	lsls r0, r0, #2
	add r0, r8
	ldr r1, [r7, #0xc]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, _0807FB8C @ =0x000003CE
	add r0, r8
	ldr r1, [r7, #0xc]
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, [r7, #0xc]
	bl GetUnitCurrentHp
	cmp r0, #0x63
	ble _0807FB94
	ldr r0, _0807FB90 @ =0x00000446
	add r0, r8
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0807FBAA
	.align 2, 0
_0807FB70: .4byte 0x0200310C
_0807FB74: .4byte 0x02022C60
_0807FB78: .4byte 0x00000342
_0807FB7C: .4byte 0x000003C2
_0807FB80: .4byte 0x000003CA
_0807FB84: .4byte 0x00000442
_0807FB88: .4byte 0x0000044A
_0807FB8C: .4byte 0x000003CE
_0807FB90: .4byte 0x00000446
_0807FB94:
	movs r4, #0x89
	lsls r4, r4, #3
	add r4, r8
	ldr r0, [r7, #0xc]
	bl GetUnitCurrentHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_0807FBAA:
	ldr r5, _0807FBC4 @ =0x0200310C
	ldr r0, [r5, #0xc]
	bl GetUnitMaxHp
	cmp r0, #0x63
	ble _0807FBCC
	ldr r0, _0807FBC8 @ =0x020230AC
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _0807FBDE
	.align 2, 0
_0807FBC4: .4byte 0x0200310C
_0807FBC8: .4byte 0x020230AC
_0807FBCC:
	ldr r4, _0807FBEC @ =0x020230AE
	ldr r0, [r5, #0xc]
	bl GetUnitMaxHp
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_0807FBDE:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807FBEC: .4byte 0x020230AE

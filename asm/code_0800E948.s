	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_FightScript
EvtCmd_FightScript: @ 0x0800E948
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	bl SetBattleScriptted
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	mov sb, r0
	mov r2, r8
	ldr r0, [r2, #0x30]
	ldr r0, [r0, #8]
	bl GetUnitFromCharId
	mov sl, r0
	mov r1, r8
	ldr r0, [r1, #0x30]
	ldr r6, [r0, #0xc]
	movs r1, #0xff
	adds r4, r1, #0
	ldrh r2, [r0, #0x12]
	ands r4, r2
	ldrb r2, [r0, #0x13]
	ands r2, r1
	str r2, [sp]
	ldrh r7, [r0, #0x10]
	ldr r1, _0800E994 @ =0x0203A85C
	cmp r2, #0
	bne _0800E998
	str r6, [r1, #0x18]
	b _0800E99C
	.align 2, 0
_0800E994: .4byte 0x0203A85C
_0800E998:
	movs r0, #0
	str r0, [r1, #0x18]
_0800E99C:
	mov r1, sb
	ldrh r0, [r1, #0x1e]
	bl GetItemType
	cmp r0, #4
	beq _0800E9AC
	cmp r7, #0
	beq _0800E9BC
_0800E9AC:
	mov r0, sb
	movs r1, #0
	bl BattleInitItemEffect
	mov r0, sl
	bl BattleInitItemEffectTarget
	b _0800E9D2
_0800E9BC:
	cmp r4, #0
	bne _0800E9CA
	mov r0, sb
	mov r1, sl
	bl BattleGenerateReal
	b _0800E9D2
_0800E9CA:
	mov r0, sb
	mov r1, sl
	bl BattleGenerateBallistaReal
_0800E9D2:
	ldr r4, _0800EA88 @ =0x0203A3F0
	adds r1, r4, #0
	adds r1, #0x6e
	movs r0, #0
	strb r0, [r1]
	ldr r5, _0800EA8C @ =0x0203A470
	adds r1, r5, #0
	adds r1, #0x6e
	strb r0, [r1]
	mov r0, sb
	bl GetUnitEquippedWeapon
	ldr r2, _0800EA90 @ =0x0203A438
	strh r0, [r2]
	adds r4, #0x4a
	strh r0, [r4]
	mov r0, sl
	bl GetUnitEquippedWeapon
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, #2
	strh r0, [r1]
	cmp r7, #0
	beq _0800EA22
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r2, _0800EA90 @ =0x0203A438
	strh r0, [r2]
	strh r0, [r4]
	cmp r7, #0x7f
	bgt _0800EA22
	cmp r7, #0x7c
	blt _0800EA22
	ldr r1, _0800EA94 @ =0x0203A3D8
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
_0800EA22:
	mov r7, r8
	adds r7, #0x5e
	ldr r0, [sp]
	cmp r0, #0
	bne _0800EA60
	bl ClearBattleHits
	ldr r2, _0800EA98 @ =0x0203A50C
	ldr r1, [r2]
	ldr r0, [r6]
	str r0, [r1]
	movs r0, #0x80
	ldrb r1, [r6, #2]
	ands r0, r1
	cmp r0, #0
	bne _0800EA5C
	adds r4, r2, #0
	movs r5, #0x80
_0800EA46:
	bl BattleHitAdvance
	adds r6, #4
	ldr r1, [r4]
	ldr r0, [r6]
	str r0, [r1]
	adds r0, r5, #0
	ldrb r2, [r6, #2]
	ands r0, r2
	cmp r0, #0
	beq _0800EA46
_0800EA5C:
	bl BattleHitTerminate
_0800EA60:
	movs r0, #4
	ldrh r7, [r7]
	ands r0, r7
	cmp r0, #0
	bne _0800EA78
	mov r0, r8
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0800EAA0
_0800EA78:
	bl BattleApplyUnitUpdates
	bl SetBattleUnscriptted
	ldr r1, _0800EA9C @ =0x0203A85C
	movs r0, #0
	str r0, [r1, #0x18]
	b _0800EAE6
	.align 2, 0
_0800EA88: .4byte 0x0203A3F0
_0800EA8C: .4byte 0x0203A470
_0800EA90: .4byte 0x0203A438
_0800EA94: .4byte 0x0203A3D8
_0800EA98: .4byte 0x0203A50C
_0800EA9C: .4byte 0x0203A85C
_0800EAA0:
	bl GetGameLock
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	adds r1, #0x52
	strh r0, [r1]
	ldr r0, _0800EAF8 @ =EventScriptedBattleWait
	mov r1, r8
	str r0, [r1, #0x40]
	mov r0, sb
	bl UnitBeginAction
	ldr r4, _0800EAFC @ =0x03004690
	ldr r0, [r4]
	bl HideUnitSprite
	ldr r0, [r4]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	bl BeginBattleAnimations
	mov r0, r8
	movs r1, #7
	bl Proc_Mark
	ldr r1, _0800EB00 @ =0x0203A97C
	mov r2, sb
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #2]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #3]
	movs r0, #2
_0800EAE6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800EAF8: .4byte EventScriptedBattleWait
_0800EAFC: .4byte 0x03004690
_0800EB00: .4byte 0x0203A97C

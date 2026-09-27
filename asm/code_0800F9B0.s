	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800F9B0
sub_0800F9B0: @ 0x0800F9B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800F9D0
	ldr r5, _0800F9CC @ =0x0000FFFF
	ands r5, r2
	b _0800F9D4
	.align 2, 0
_0800F9CC: .4byte 0x0000FFFF
_0800F9D0:
	movs r5, #1
	rsbs r5, r5, #0
_0800F9D4:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800F9E8
	adds r6, r3, #0
_0800F9E8:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FA24
	cmp r2, #0
	beq _0800FA12
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #5
	adds r2, r7, #0
	movs r3, #0
	bl WmMergeFace
	b _0800FA24
_0800FA12:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl sub_080B4C60
_0800FA24:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FA30
sub_0800FA30: @ 0x0800FA30
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FA48
	adds r0, r2, #0
	bl sub_080B4D14
_0800FA48:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FA50
sub_0800FA50: @ 0x0800FA50
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r7, [r0, #4]
	ldr r2, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FA70
	ldr r5, _0800FA6C @ =0x0000FFFF
	ands r5, r2
	b _0800FA74
	.align 2, 0
_0800FA6C: .4byte 0x0000FFFF
_0800FA70:
	movs r5, #1
	rsbs r5, r5, #0
_0800FA74:
	ldr r1, [r4, #0x30]
	ldrh r3, [r1, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800FA88
	adds r6, r3, #0
_0800FA88:
	ldr r3, [r1, #0xc]
	ldr r2, [r1, #0x10]
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FAC4
	cmp r2, #0
	beq _0800FAB2
	str r5, [sp]
	str r6, [sp, #4]
	str r3, [sp, #8]
	adds r0, r2, #0
	movs r1, #4
	adds r2, r7, #0
	movs r3, #0
	bl WmMergeFace
	b _0800FAC4
_0800FAB2:
	lsls r1, r5, #0x10
	asrs r1, r1, #0x10
	lsls r2, r6, #0x10
	asrs r2, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, #0
	bl sub_080B4B8C
_0800FAC4:
	movs r0, #0
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FAD0
sub_0800FAD0: @ 0x0800FAD0
	push {lr}
	ldr r1, [r0, #0x30]
	ldr r2, [r1, #4]
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FAE8
	adds r0, r2, #0
	bl sub_080B4C28
_0800FAE8:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FAF0
sub_0800FAF0: @ 0x0800FAF0
	push {r4, r5, lr}
	sub sp, #0xc
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FB10
	ldr r4, _0800FB0C @ =0x0000FFFF
	ands r4, r2
	b _0800FB14
	.align 2, 0
_0800FB0C: .4byte 0x0000FFFF
_0800FB10:
	movs r4, #1
	rsbs r4, r4, #0
_0800FB14:
	ldr r3, [r1, #0x30]
	ldrh r2, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FB28
	adds r5, r2, #0
_0800FB28:
	ldr r2, [r3, #8]
	ldr r3, [r3, #0xc]
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _0800FB3C
	movs r0, #0
	b _0800FB5E
_0800FB3C:
	cmp r3, #0
	beq _0800FB54
	str r4, [sp]
	str r5, [sp, #4]
	str r2, [sp, #8]
	adds r0, r3, #0
	movs r1, #8
	movs r2, #0
	movs r3, #0
	bl WmMergeFace
	b _0800FB5C
_0800FB54:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_080B4F9C
_0800FB5C:
	movs r0, #2
_0800FB5E:
	add sp, #0xc
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_SetKeyIgnore
EvtCmd_SetKeyIgnore: @ 0x0800FB68
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl SetkeyStIgnoredMask
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_SetFightScriptOverride
EvtCmd_SetFightScriptOverride: @ 0x0800FB78
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	bl SetScriptedBattle
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_ClearMenuOverrides
EvtCmd_ClearMenuOverrides: @ 0x0800FB88
	push {lr}
	bl ClearMenuOverrides
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_MenuOverrideHide
EvtCmd_MenuOverrideHide: @ 0x0800FB94
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBA8 @ =MenuAlwaysNotShown
	movs r1, #1
	bl SetMenuOverride
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FBA8: .4byte MenuAlwaysNotShown

	thumb_func_start EvtCmd_MenuOverrideDisable
EvtCmd_MenuOverrideDisable: @ 0x0800FBAC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBD0 @ =sub_0804A8FC
	movs r1, #1
	bl SetMenuOverride
	ldr r0, [r4, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBD4 @ =sub_0801B244
	movs r1, #2
	bl SetMenuOverride
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800FBD0: .4byte sub_0804A8FC
_0800FBD4: .4byte sub_0801B244

	thumb_func_start EvtCmd_MenuOverrideEnable
EvtCmd_MenuOverrideEnable: @ 0x0800FBD8
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	ldr r2, _0800FBEC @ =sub_0804A8F8
	movs r1, #1
	bl SetMenuOverride
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800FBEC: .4byte sub_0804A8F8

	thumb_func_start EvtCmd_BoxTalk
EvtCmd_BoxTalk: @ 0x0800FBF0
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r3, [r2, #0x30]
	ldrh r6, [r3, #2]
	movs r4, #0
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FC8E
	ldr r1, [r3, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FC20
	ldr r3, _0800FC1C @ =0x0000FFFF
	ands r3, r1
	b _0800FC24
	.align 2, 0
_0800FC1C: .4byte 0x0000FFFF
_0800FC20:
	movs r3, #1
	rsbs r3, r3, #0
_0800FC24:
	ldr r1, [r2, #0x30]
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r5, #1
	rsbs r5, r5, #0
	cmp r0, #0
	bne _0800FC38
	adds r5, r2, #0
_0800FC38:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r3, #0
	bl StartBoxDialogueSimple
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	beq _0800FC50
	movs r0, #0x10
	orrs r4, r0
_0800FC50:
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0800FC60
	movs r0, #0x80
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FC60:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0800FC74
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FC74:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0800FC84
	movs r0, #0x20
	orrs r4, r0
	lsls r0, r4, #0x10
	lsrs r4, r0, #0x10
_0800FC84:
	cmp r6, #0
	beq _0800FC8E
	adds r0, r4, #0
	bl SetDialogueBoxConfig
_0800FC8E:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_BoxTalkByTactGender
EvtCmd_BoxTalkByTactGender: @ 0x0800FC98
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FD2A
	bl IsTactFemale
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0800FCF0
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FCCC
	ldr r3, _0800FCC8 @ =0x0000FFFF
	ands r3, r2
	b _0800FCD0
	.align 2, 0
_0800FCC8: .4byte 0x0000FFFF
_0800FCCC:
	movs r3, #1
	rsbs r3, r3, #0
_0800FCD0:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FCE2
	adds r4, r2, #0
_0800FCE2:
	ldr r2, [r1, #8]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl StartBoxDialogueSimple
	b _0800FD2A
_0800FCF0:
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FD08
	ldr r3, _0800FD04 @ =0x0000FFFF
	ands r3, r2
	b _0800FD0C
	.align 2, 0
_0800FD04: .4byte 0x0000FFFF
_0800FD08:
	movs r3, #1
	rsbs r3, r3, #0
_0800FD0C:
	ldrh r2, [r1, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, #0
	bne _0800FD1E
	adds r4, r2, #0
_0800FD1E:
	ldr r2, [r1, #0xc]
	adds r0, r3, #0
	adds r1, r4, #0
	movs r3, #0
	bl StartBoxDialogueSimple
_0800FD2A:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FD34
sub_0800FD34: @ 0x0800FD34
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0800FD48
	movs r0, #0
	bl StartNoBoxTalk
_0800FD48:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TutorialCursorsTargetMove
EvtCmd_TutorialCursorsTargetMove: @ 0x0800FD50
	push {lr}
	movs r0, #0
	bl StartTutorialCursors
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_TutorialCursors
EvtCmd_TutorialCursors: @ 0x0800FD60
	push {lr}
	ldr r0, [r0, #0x30]
	ldr r0, [r0, #4]
	cmp r0, #0
	bne _0800FD72
	movs r0, #1
	bl StartTutorialCursors
	b _0800FD76
_0800FD72:
	bl StartTutorialCursors
_0800FD76:
	movs r0, #0
	pop {r1}
	bx r1

	thumb_func_start sub_0800FD7C
sub_0800FD7C: @ 0x0800FD7C
	ldr r1, [r0, #0x30]
	ldr r3, [r1, #4]
	ldr r2, [r0, #0x2c]
	str r2, [r0, #0x34]
	adds r1, #8
	str r1, [r0, #0x38]
	str r3, [r0, #0x30]
	str r3, [r0, #0x2c]
	movs r0, #1
	bx lr

	thumb_func_start EventCD_Warp
EventCD_Warp: @ 0x0800FD90
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r2, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r2
	cmp r0, #0
	bne _0800FDB0
	ldr r5, _0800FDAC @ =0x0000FFFF
	ands r5, r2
	b _0800FDB4
	.align 2, 0
_0800FDAC: .4byte 0x0000FFFF
_0800FDB0:
	movs r5, #1
	rsbs r5, r5, #0
_0800FDB4:
	ldr r3, [r4, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r6, #1
	rsbs r6, r6, #0
	cmp r0, #0
	bne _0800FDC8
	adds r6, r1, #0
_0800FDC8:
	ldr r3, [r3, #8]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #4
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #0
	beq _0800FDE0
	movs r0, #0
	b _0800FE10
_0800FDE0:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FDFC
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r2, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartEventWarpAnim
	b _0800FE0E
_0800FDFC:
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl StartEventWarpAnim
_0800FE0E:
	movs r0, #2
_0800FE10:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_0800FE18
sub_0800FE18: @ 0x0800FE18
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	ldr r6, [r0, #8]
	ldr r0, [r0, #4]
	bl GetUnitFromCharId
	adds r2, r0, #0
	adds r0, r4, #0
	adds r0, #0x5e
	ldrh r3, [r0]
	movs r0, #4
	ands r0, r3
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	beq _0800FE40
	movs r0, #0
	b _0800FE76
_0800FE40:
	movs r5, #0x10
	ldrsb r5, [r2, r5]
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0800FE64
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	str r1, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartEventWarpAnim
	b _0800FE74
_0800FE64:
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	movs r0, #1
	str r0, [sp]
	adds r0, r4, #0
	adds r1, r5, #0
	bl StartEventWarpAnim
_0800FE74:
	movs r0, #2
_0800FE76:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0800FE80
sub_0800FE80: @ 0x0800FE80
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0800FE9C
	ldr r2, _0800FE98 @ =0x0000FFFF
	ands r2, r1
	b _0800FEA0
	.align 2, 0
_0800FE98: .4byte 0x0000FFFF
_0800FE9C:
	movs r2, #1
	rsbs r2, r2, #0
_0800FEA0:
	ldr r3, [r5, #0x30]
	ldrh r1, [r3, #6]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	movs r7, #1
	rsbs r7, r7, #0
	cmp r0, #0
	bne _0800FEB4
	adds r7, r1, #0
_0800FEB4:
	ldr r6, [r3, #8]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0800FEE8
	adds r0, r2, #0
	bl sub_080B6278
	adds r4, r0, #0
	subs r4, #0x10
	adds r0, r7, #0
	bl sub_080B6288
	adds r2, r0, #0
	subs r2, #0x28
	lsls r3, r6, #0x18
	asrs r3, r3, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl StartWarpEffect_08020A64
	movs r0, #2
	b _0800FEEA
_0800FEE8:
	movs r0, #0
_0800FEEA:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	thumb_func_start EventStartCgTalk
EventStartCgTalk: @ 0x0800FEF0
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	bl ApplySystemObjectsGraphics
	movs r0, #0x80
	movs r1, #0
	movs r2, #1
	bl InitTalk
	movs r0, #1
	bl EnableBgSync
	cmp r4, #0
	beq _0800FF1A
	cmp r4, #1
	beq _0800FF34
	b _0800FF50
_0800FF1A:
	str r7, [sp]
	ldr r0, _0800FF88 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	str r4, [sp, #0xc]
	movs r0, #3
	movs r1, #2
	movs r2, #0x14
	movs r3, #4
	bl StartCgText
_0800FF34:
	str r7, [sp]
	ldr r0, _0800FF88 @ =0x06011000
	str r0, [sp, #4]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	movs r0, #3
	movs r1, #0x12
	movs r2, #0x14
	movs r3, #4
	bl StartCgText
_0800FF50:
	ldr r0, _0800FF8C @ =Event_CgTalkOnSkip
	str r0, [r6, #0x40]
	adds r0, r6, #0
	adds r0, #0x5e
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0800FF66
	movs r0, #0x40
	orrs r5, r0
_0800FF66:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0800FF7A
	ldr r0, _0800FF90 @ =0x00002820
	orrs r5, r0
	adds r0, r6, #0
	bl EventForceSlowTextSpeed
_0800FF7A:
	adds r0, r5, #0
	bl SetCgTextFlags
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800FF88: .4byte 0x06011000
_0800FF8C: .4byte Event_CgTalkOnSkip
_0800FF90: .4byte 0x00002820

	thumb_func_start EvtCmd_CgTalk
EvtCmd_CgTalk: @ 0x0800FF94
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _0800FFC4 @ =0x0000FFFD
	ldrh r5, [r1]
	ands r0, r5
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0800FFC8
	adds r0, r2, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl EventStartCgTalk
	movs r0, #2
	b _0800FFCA
	.align 2, 0
_0800FFC4: .4byte 0x0000FFFD
_0800FFC8:
	movs r0, #0
_0800FFCA:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_0800FFD0
sub_0800FFD0: @ 0x0800FFD0
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	ldr r2, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
	adds r1, r3, #0
	adds r1, #0x5e
	ldr r0, _08010004 @ =0x0000FFFD
	ldrh r6, [r1]
	ands r0, r6
	strh r0, [r1]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08010008
	adds r0, r4, #0
	adds r1, r5, #0
	bl EventStartCgTalk
	movs r0, #2
	b _0801000A
	.align 2, 0
_08010004: .4byte 0x0000FFFD
_08010008:
	movs r0, #0
_0801000A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08010010
sub_08010010: @ 0x08010010
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r1, [r0, #4]
	ldr r4, [r0, #8]
	adds r0, r3, #0
	adds r0, #0x5e
	ldrh r2, [r0]
	movs r0, #4
	ands r0, r2
	cmp r0, #0
	bne _08010040
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	bne _08010040
	adds r0, r1, #0
	adds r1, r4, #0
	movs r2, #0x80
	lsls r2, r2, #3
	bl EventStartCgTalk
	movs r0, #2
	b _08010042
_08010040:
	movs r0, #0
_08010042:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_08010048
sub_08010048: @ 0x08010048
	push {lr}
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	bne _0801005E
	bl EndCgText
	movs r0, #2
	b _08010060
_0801005E:
	movs r0, #0
_08010060:
	pop {r1}
	bx r1

	thumb_func_start EvtCmd_CgBackground
EvtCmd_CgBackground: @ 0x08010064
	push {r4, r5, lr}
	sub sp, #4
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldrh r5, [r0, #2]
	adds r1, r2, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08010080
	movs r0, #0
	b _080100C2
_08010080:
	adds r4, r2, #0
	adds r4, #0x4c
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08010098
	bl LockBmDisplay
	bl LockMus
_08010098:
	movs r0, #0x61
	strb r0, [r4]
	movs r0, #3
	bl GetBgChrOffset
	adds r1, r0, #0
	ldr r0, _080100CC @ =0x02024460
	str r5, [sp]
	movs r2, #8
	movs r3, #8
	bl PutCgBackground
	movs r0, #8
	bl EnableBgSync
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r0, #2
_080100C2:
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080100CC: .4byte 0x02024460

	thumb_func_start sub_080100D0
sub_080100D0: @ 0x080100D0
	adds r0, #0x5e
	movs r1, #4
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _080100DE
	movs r0, #0
_080100DE:
	bx lr

	thumb_func_start EvtCmd_PaletteFadeFromBlack
EvtCmd_PaletteFadeFromBlack: @ 0x080100E0
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _080100FA
	movs r0, #0
	b _08010132
_080100FA:
	cmp r3, #1
	beq _0801011A
	cmp r3, #1
	bgt _08010108
	cmp r3, #0
	beq _08010112
	b _08010130
_08010108:
	cmp r3, #2
	beq _08010122
	cmp r3, #3
	beq _0801012A
	b _08010130
_08010112:
	movs r0, #0x10
	bl StartLockingPaletteFadeFromBlack
	b _08010130
_0801011A:
	movs r0, #8
	bl StartLockingPaletteFadeFromBlack
	b _08010130
_08010122:
	movs r0, #4
	bl StartLockingPaletteFadeFromBlack
	b _08010130
_0801012A:
	movs r0, #2
	bl StartLockingPaletteFadeFromBlack
_08010130:
	movs r0, #2
_08010132:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EvtCmd_PaletteFadeToBlack
EvtCmd_PaletteFadeToBlack: @ 0x08010138
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldrh r3, [r0, #2]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08010152
	movs r0, #0
	b _0801018A
_08010152:
	cmp r3, #1
	beq _08010172
	cmp r3, #1
	bgt _08010160
	cmp r3, #0
	beq _0801016A
	b _08010188
_08010160:
	cmp r3, #2
	beq _0801017A
	cmp r3, #3
	beq _08010182
	b _08010188
_0801016A:
	movs r0, #0x10
	bl StartLockingPaletteFadeToBlack
	b _08010188
_08010172:
	movs r0, #8
	bl StartLockingPaletteFadeToBlack
	b _08010188
_0801017A:
	movs r0, #4
	bl StartLockingPaletteFadeToBlack
	b _08010188
_08010182:
	movs r0, #2
	bl StartLockingPaletteFadeToBlack
_08010188:
	movs r0, #2
_0801018A:
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start Event_CgTalkOnSkip
Event_CgTalkOnSkip: @ 0x08010190
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080101B2
	bl EndCgText
	adds r0, r4, #0
	bl sub_0800AF20
	movs r0, #0
	str r0, [r4, #0x40]
	b _080101C6
_080101B2:
	bl sub_08087D58
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, #0
	bne _080101C6
	adds r0, r4, #0
	bl sub_0800AF20
	str r5, [r4, #0x40]
_080101C6:
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_080101CC
sub_080101CC: @ 0x080101CC
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, [r6, #0x38]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	ldr r4, _080102E4 @ =0x0001FFFF
	ands r0, r4
	lsrs r0, r0, #5
	str r0, [sp, #4]
	ldr r1, [r6, #0x3c]
	adds r0, r1, #1
	movs r3, #0xf
	ands r0, r3
	lsls r0, r0, #0xc
	ldr r5, [sp, #4]
	orrs r5, r0
	str r5, [sp, #4]
	ands r2, r4
	lsrs r7, r2, #5
	ands r1, r3
	lsls r1, r1, #0xc
	orrs r7, r1
	ldr r1, [r6, #0x30]
	adds r4, r6, #0
	adds r4, #0x48
	ldr r2, [r6, #0x34]
	ldrh r0, [r4]
	adds r2, r0, r2
	ldr r5, _080102E8 @ =0x08B905E8
	str r7, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldr r2, [r6, #0x34]
	ldrh r3, [r4]
	adds r2, r3, r2
	adds r0, r7, #4
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xd
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #2
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0x11
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	ldr r5, _080102EC @ =0x08B905B0
	adds r0, r7, #6
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xb
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xa
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	ldr r0, [r6, #0x44]
	subs r0, #1
	lsls r0, r0, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldrh r0, [r4]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r5, #2
	b _0801030E
	.align 2, 0
_080102E4: .4byte 0x0001FFFF
_080102E8: .4byte 0x08B905E8
_080102EC: .4byte 0x08B905B0
_080102F0:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	adds r0, r6, #0
	adds r0, #0x48
	ldr r2, [r6, #0x34]
	ldrh r0, [r0]
	adds r2, r0, r2
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _0801034C @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #2
_0801030E:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _080102F0
	ldr r0, [r6, #0x44]
	subs r0, #1
	movs r1, #0x48
	adds r1, r1, r6
	mov sl, r1
	cmp r5, r0
	bge _08010348
_08010324:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	ldr r2, [r6, #0x34]
	mov r3, sl
	ldrh r3, [r3]
	adds r2, r3, r2
	adds r0, r7, #2
	str r0, [sp]
	movs r0, #4
	ldr r3, _08010350 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _08010324
_08010348:
	movs r5, #2
	b _08010374
	.align 2, 0
_0801034C: .4byte 0x08B905E8
_08010350: .4byte 0x08B905B0
_08010354:
	lsls r0, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r0
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #0x18
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	adds r0, r7, #0
	adds r0, #0xf
	str r0, [sp]
	movs r0, #4
	ldr r3, _08010454 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #2
_08010374:
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _08010354
	movs r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	bge _080103CE
	mov sb, sl
	movs r3, #8
	adds r3, r3, r7
	mov r8, r3
_0801038E:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	ldr r3, _08010454 @ =0x08B905E8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, sb
	ldrh r0, [r2]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	mov r3, r8
	str r3, [sp]
	movs r0, #4
	ldr r3, _08010454 @ =0x08B905E8
	bl PutSpriteExt
	adds r5, #2
	ldr r0, [r6, #0x44]
	subs r0, #2
	cmp r5, r0
	blt _0801038E
_080103CE:
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	bge _0801041A
	mov r8, sl
	ldr r0, _08010458 @ =0x08B905B0
	mov sb, r0
	adds r7, #8
_080103DE:
	lsls r4, r5, #3
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r2, r8
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, r1, r4
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #0x10
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r7, [sp]
	movs r0, #4
	mov r3, sb
	bl PutSpriteExt
	adds r5, #1
	ldr r0, [r6, #0x44]
	subs r0, #1
	cmp r5, r0
	blt _080103DE
_0801041A:
	ldr r4, [sp, #4]
	movs r7, #8
	movs r5, #2
_08010420:
	ldr r1, [r6, #0x30]
	adds r1, r1, r7
	mov r2, sl
	ldrh r0, [r2]
	adds r0, #8
	ldr r2, [r6, #0x34]
	adds r2, r2, r0
	str r4, [sp]
	movs r0, #0
	ldr r3, _0801045C @ =0x08B905F8
	bl PutSpriteExt
	adds r4, #4
	adds r7, #0x20
	subs r5, #1
	cmp r5, #0
	bge _08010420
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010454: .4byte 0x08B905E8
_08010458: .4byte 0x08B905B0
_0801045C: .4byte 0x08B905F8

	thumb_func_start sub_08010460
sub_08010460: @ 0x08010460
	bx lr
	.align 2, 0

	thumb_func_start sub_08010464
sub_08010464: @ 0x08010464
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r2, #0
	beq _08010488
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08010482
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
	b _08010488
_08010482:
	adds r0, r2, #0
	adds r0, #0x48
	strh r1, [r0]
_08010488:
	bx lr
	.align 2, 0

	thumb_func_start sub_0801048C
sub_0801048C: @ 0x0801048C
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080104F8 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x44
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r3, [r0]
	ldr r0, _080104FC @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	ldr r1, _08010500 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08010504 @ =0x08B91EDC
	bl Proc_Find
	movs r1, #1
	bl sub_08010464
	pop {r0}
	bx r0
	.align 2, 0
_080104F8: .4byte 0x03002870
_080104FC: .4byte 0x0000FFE0
_08010500: .4byte 0x0000E0FF
_08010504: .4byte 0x08B91EDC

	thumb_func_start sub_08010508
sub_08010508: @ 0x08010508
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r3, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r6, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r4, [r0, r1]
	ldr r2, _08010588 @ =0x03002870
	adds r5, r2, #0
	adds r5, #0x3c
	movs r0, #0x3f
	mov sl, r0
	ldrb r1, [r5]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0x44
	adds r0, r0, r2
	mov sb, r0
	strb r4, [r0]
	movs r0, #0x10
	subs r0, r0, r4
	movs r1, #0x45
	adds r1, r1, r2
	mov r8, r1
	strb r0, [r1]
	adds r7, r2, #0
	adds r7, #0x46
	strb r6, [r7]
	cmp r4, #0x10
	bne _08010578
	adds r0, r3, #0
	bl Proc_Break
	mov r0, sl
	ldrb r1, [r5]
	ands r0, r1
	strb r0, [r5]
	mov r0, sb
	strb r4, [r0]
	mov r1, r8
	strb r6, [r1]
	strb r6, [r7]
	ldr r0, _0801058C @ =0x08B91EDC
	bl Proc_Find
	movs r1, #0
	bl sub_08010464
_08010578:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010588: .4byte 0x03002870
_0801058C: .4byte 0x08B91EDC

	thumb_func_start sub_08010590
sub_08010590: @ 0x08010590
	push {lr}
	adds r0, #0x4c
	movs r3, #0
	movs r1, #0
	strh r1, [r0]
	ldr r0, _080105FC @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	mov r1, ip
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r3, [r0]
	ldr r0, _08010600 @ =0x0000FFE0
	mov r3, ip
	ldrh r3, [r3, #0x3c]
	ands r0, r3
	ldr r1, _08010604 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xf8
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	mov r1, ip
	strh r0, [r1, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	mov r1, ip
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, _08010608 @ =0x08B91EDC
	bl Proc_Find
	movs r1, #1
	bl sub_08010464
	pop {r0}
	bx r0
	.align 2, 0
_080105FC: .4byte 0x03002870
_08010600: .4byte 0x0000FFE0
_08010604: .4byte 0x0000E0FF
_08010608: .4byte 0x08B91EDC

	thumb_func_start sub_0801060C
sub_0801060C: @ 0x0801060C
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x4c
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	movs r1, #0
	ldrsh r3, [r0, r1]
	ldr r0, _08010660 @ =0x03002870
	mov ip, r0
	mov r2, ip
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r3
	mov r1, ip
	adds r1, #0x44
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r3, [r0]
	adds r0, #1
	strb r4, [r0]
	cmp r3, #0x10
	bne _0801065A
	ldr r0, _08010664 @ =0x08B91EDC
	bl Proc_Find
	bl Proc_End
	adds r0, r5, #0
	bl Proc_Break
_0801065A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010660: .4byte 0x03002870
_08010664: .4byte 0x08B91EDC

	thumb_func_start sub_08010668
sub_08010668: @ 0x08010668
	ldr r3, _0801068C @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bx lr
	.align 2, 0
_0801068C: .4byte 0x03002870

	thumb_func_start sub_08010690
sub_08010690: @ 0x08010690
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	movs r6, #0
	ldr r0, _08010788 @ =0x08B91EDC
	ldr r1, [sp, #0x44]
	bl Proc_Start
	adds r7, r0, #0
	adds r0, r4, #0
	bl DecodeMsg
	mov sl, r0
	mov r0, r8
	str r0, [r7, #0x30]
	mov r2, sb
	str r2, [r7, #0x34]
	str r5, [r7, #0x38]
	ldr r0, [sp, #0x40]
	str r0, [r7, #0x3c]
	str r4, [r7, #0x40]
	adds r0, r7, #0
	adds r0, #0x48
	strh r6, [r0]
	ldr r0, _0801078C @ =0x08B91EFC
	ldr r1, [sp, #0x44]
	bl Proc_StartBlocking
	ldr r0, _08010790 @ =0x0842535C
	ldr r1, [r7, #0x3c]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010794 @ =0x08194674
	ldr r1, [r7, #0x3c]
	adds r1, #0x11
	lsls r1, r1, #5
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08010798 @ =0x084251BC
	ldr r1, [r7, #0x38]
	ldr r2, _0801079C @ =0x06010000
	adds r1, r1, r2
	bl Decompress
	mov r0, sl
	bl GetStringTextLen
	adds r6, r0, #0
	cmp r6, #0
	bge _0801070C
	adds r0, r6, #7
_0801070C:
	asrs r5, r0, #3
	adds r6, r5, #5
	str r6, [r7, #0x44]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	bge _0801071C
	movs r0, #8
	str r0, [r7, #0x30]
_0801071C:
	ldr r0, [r7, #0x44]
	lsls r1, r0, #3
	ldr r0, [r7, #0x30]
	adds r0, r0, r1
	cmp r0, #0xf0
	ble _0801072E
	movs r0, #0xe8
	subs r0, r0, r1
	str r0, [r7, #0x30]
_0801072E:
	ldr r1, [r7, #0x38]
	ldr r0, _080107A0 @ =0x06010400
	adds r1, r1, r0
	ldr r2, [r7, #0x3c]
	adds r2, #0x12
	mov r0, sp
	bl InitSpriteTextFont
	mov r0, sp
	bl SetTextFont
	add r4, sp, #0x18
	adds r0, r4, #0
	bl InitSpriteText
	adds r0, r4, #0
	movs r1, #0
	bl SpriteText_DrawBackgroundExt
	movs r0, #0
	bl SetTextFontGlyphs
	adds r0, r5, #3
	lsls r0, r0, #3
	mov r1, sl
	bl GetStringTextCenteredPos
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	mov r3, sl
	bl Text_InsertDrawString
	movs r0, #0
	bl SetTextFont
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010788: .4byte 0x08B91EDC
_0801078C: .4byte 0x08B91EFC
_08010790: .4byte 0x0842535C
_08010794: .4byte 0x08194674
_08010798: .4byte 0x084251BC
_0801079C: .4byte 0x06010000
_080107A0: .4byte 0x06010400

	thumb_func_start sub_080107A4
sub_080107A4: @ 0x080107A4
	push {r4, r5, lr}
	sub sp, #8
	adds r2, r0, #0
	ldr r0, [r2, #0x30]
	ldr r5, [r0, #4]
	ldr r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	bne _080107C4
	ldr r4, _080107C0 @ =0x0000FFFF
	ands r4, r1
	b _080107C8
	.align 2, 0
_080107C0: .4byte 0x0000FFFF
_080107C4:
	movs r4, #1
	rsbs r4, r4, #0
_080107C8:
	ldr r0, [r2, #0x30]
	ldrh r3, [r0, #0xa]
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r3
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, #0
	bne _080107DC
	adds r1, r3, #0
_080107DC:
	adds r3, r2, #0
	adds r3, #0x5e
	movs r0, #4
	ldrh r3, [r3]
	ands r0, r3
	cmp r0, #0
	bne _08010800
	movs r3, #0xa0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	adds r2, r5, #0
	bl sub_08010690
	movs r0, #2
	b _08010802
_08010800:
	movs r0, #0
_08010802:
	add sp, #8
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_0801080C
sub_0801080C: @ 0x0801080C
	push {lr}
	adds r1, r0, #0
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	beq _08010830
	ldr r0, _0801082C @ =0x08B91EDC
	bl Proc_Find
	bl Proc_End
	movs r0, #0
	b _08010858
	.align 2, 0
_0801082C: .4byte 0x08B91EDC
_08010830:
	adds r0, r1, #0
	adds r0, #0x4d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010850
	ldr r0, _0801084C @ =0x08B91EDC
	bl Proc_Find
	bl Proc_End
	b _08010856
	.align 2, 0
_0801084C: .4byte 0x08B91EDC
_08010850:
	ldr r0, _0801085C @ =0x08B91F14
	bl Proc_StartBlocking
_08010856:
	movs r0, #2
_08010858:
	pop {r1}
	bx r1
	.align 2, 0
_0801085C: .4byte 0x08B91F14

	thumb_func_start sub_08010860
sub_08010860: @ 0x08010860
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r4, _08010910 @ =0x03002870
	movs r6, #1
	ldrb r0, [r4, #1]
	orrs r0, r6
	movs r7, #2
	orrs r0, r7
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	adds r3, r4, #0
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	adds r1, r4, #0
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, _08010914 @ =0x0000FFE0
	ldrh r2, [r4, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _08010918 @ =0x0000E0FF
	ands r0, r1
	movs r2, #0x80
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #0x20
	ldrb r1, [r3]
	orrs r1, r0
	strb r1, [r3]
	adds r1, r4, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r5, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0801091C
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r2, [r4, #0xc]
	ands r0, r2
	strb r0, [r4, #0xc]
	adds r0, r1, #0
	ldrb r2, [r4, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r7
	strb r1, [r4, #0x14]
	movs r0, #3
	ldrb r1, [r4, #0x18]
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #8
	b _0801091E
	.align 2, 0
_08010910: .4byte 0x03002870
_08010914: .4byte 0x0000FFE0
_08010918: .4byte 0x0000E0FF
_0801091C:
	movs r0, #6
_0801091E:
	str r0, [r5, #0x44]
	movs r0, #0
	str r0, [r5, #0x30]
	ldr r0, _08010934 @ =0x08B90D88
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010934: .4byte 0x08B90D88

	thumb_func_start sub_08010938
sub_08010938: @ 0x08010938
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080109A0 @ =0x06008000
	ldr r1, _080109A4 @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _080109A8 @ =0x02022960
	ldr r2, _080109AC @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _080109B0 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _080109B4 @ =0x00008080
	adds r4, r5, #0
	ldr r3, _080109B8 @ =0x02024460
	ldr r2, _080109BC @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #3
_08010966:
	ldrh r5, [r3]
	adds r0, r4, r5
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08010966
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _080109C0 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080109A0: .4byte 0x06008000
_080109A4: .4byte 0x06001000
_080109A8: .4byte 0x02022960
_080109AC: .4byte 0xFFFFFF00
_080109B0: .4byte 0x001FFFFF
_080109B4: .4byte 0x00008080
_080109B8: .4byte 0x02024460
_080109BC: .4byte 0x02023C60
_080109C0: .4byte 0x03002870

	thumb_func_start sub_080109C4
sub_080109C4: @ 0x080109C4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010A2C
	ldr r4, _08010A20 @ =0x08B91588
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08010A24 @ =0x06008000
	bl Decompress
	ldr r0, _08010A28 @ =0x02024460
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl TmApplyTsa_thm
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x44]
	lsls r2, r2, #5
	bl ApplyPaletteExt
	b _08010A3E
	.align 2, 0
_08010A20: .4byte 0x08B91588
_08010A24: .4byte 0x06008000
_08010A28: .4byte 0x02024460
_08010A2C:
	ldr r0, _08010A4C @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #8
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #8
	bl PutCgBackground
_08010A3E:
	movs r0, #8
	bl EnableBgSync
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010A4C: .4byte 0x02024460

	thumb_func_start sub_08010A50
sub_08010A50: @ 0x08010A50
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08010A98 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _08010A92
	adds r0, r4, #0
	bl Proc_Break
_08010A92:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010A98: .4byte 0x03002870

	thumb_func_start sub_08010A9C
sub_08010A9C: @ 0x08010A9C
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08010AF0 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08010AF4 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	ldr r0, [r4, #0x34]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010AE8
	bl InitBmBgLayers
_08010AE8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010AF0: .4byte 0x02023C60
_08010AF4: .4byte 0x03002870

	thumb_func_start sub_08010AF8
sub_08010AF8: @ 0x08010AF8
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010B20 @ =0x08B91F34
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x34]
	movs r1, #0xff
	ands r1, r6
	str r1, [r0, #0x38]
	adds r0, #0x3c
	strb r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010B20: .4byte 0x08B91F34

	thumb_func_start sub_08010B24
sub_08010B24: @ 0x08010B24
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _08010BD8 @ =0x03002870
	movs r6, #1
	ldrb r0, [r7, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08010BDC @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	movs r1, #4
	orrs r0, r1
	ldr r1, _08010BE0 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #6
	str r0, [r5, #0x44]
	str r4, [r5, #0x30]
	ldr r0, _08010BE4 @ =0x08B90D88
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010BD8: .4byte 0x03002870
_08010BDC: .4byte 0x0000FFE0
_08010BE0: .4byte 0x0000E0FF
_08010BE4: .4byte 0x08B90D88

	thumb_func_start sub_08010BE8
sub_08010BE8: @ 0x08010BE8
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08010C4C
	ldr r4, _08010C40 @ =0x08B91588
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _08010C44 @ =0x06001000
	bl Decompress
	ldr r0, _08010C48 @ =0x02023C60
	ldr r2, [r5, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r4, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	bl TmApplyTsa_thm
	ldr r1, [r5, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #8
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r2, [r5, #0x44]
	lsls r2, r2, #5
	movs r1, #0
	bl ApplyPaletteExt
	b _08010C5E
	.align 2, 0
_08010C40: .4byte 0x08B91588
_08010C44: .4byte 0x06001000
_08010C48: .4byte 0x02023C60
_08010C4C:
	ldr r0, _08010C8C @ =0x02023C60
	movs r1, #0x80
	lsls r1, r1, #5
	ldr r3, [r5, #0x44]
	ldr r2, [r5, #0x2c]
	str r2, [sp]
	movs r2, #0
	bl PutCgBackground
_08010C5E:
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r2, _08010C90 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010C8C: .4byte 0x02023C60
_08010C90: .4byte 0x03002870

	thumb_func_start sub_08010C94
sub_08010C94: @ 0x08010C94
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08010CDC @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x44
	movs r1, #0
	strb r2, [r0]
	movs r0, #0x10
	subs r0, r0, r2
	adds r3, #9
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x46
	strb r1, [r0]
	cmp r2, #0x10
	bne _08010CD6
	adds r0, r4, #0
	bl Proc_Break
_08010CD6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08010CDC: .4byte 0x03002870

	thumb_func_start sub_08010CE0
sub_08010CE0: @ 0x08010CE0
	push {r4, r5, lr}
	adds r4, r0, #0
	bl LockBmDisplay
	bl LockMus
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, _08010D40 @ =0x06001000
	ldr r1, _08010D44 @ =0x06008000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08010D48 @ =0x02022860
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _08010D4C @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	movs r5, #0xff
	lsls r5, r5, #7
	adds r4, r5, #0
	ldr r3, _08010D50 @ =0x02023C60
	ldr r2, _08010D54 @ =0x02024460
	movs r1, #0x80
	lsls r1, r1, #3
_08010D24:
	ldrh r5, [r3]
	adds r0, r4, r5
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bne _08010D24
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010D40: .4byte 0x06001000
_08010D44: .4byte 0x06008000
_08010D48: .4byte 0x02022860
_08010D4C: .4byte 0x001FFFFF
_08010D50: .4byte 0x02023C60
_08010D54: .4byte 0x02024460

	thumb_func_start sub_08010D58
sub_08010D58: @ 0x08010D58
	push {lr}
	ldr r0, _08010D90 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08010D94 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_08010D90: .4byte 0x02023C60
_08010D94: .4byte 0x03002870

	thumb_func_start sub_08010D98
sub_08010D98: @ 0x08010D98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r1, r3, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08010DC0 @ =0x08B91F84
	bl Proc_StartBlocking
	str r5, [r0, #0x2c]
	str r6, [r0, #0x34]
	movs r1, #0xff
	ands r1, r6
	str r1, [r0, #0x38]
	adds r0, #0x3c
	strb r4, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08010DC0: .4byte 0x08B91F84

	thumb_func_start sub_08010DC4
sub_08010DC4: @ 0x08010DC4
	push {r4, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08010DEE
	adds r0, r3, #0
	adds r0, #0x4c
	strb r2, [r0]
	adds r0, r4, #0
	movs r1, #1
	bl sub_08010AF8
	movs r0, #2
	b _08010DF0
_08010DEE:
	movs r0, #0
_08010DF0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_08010DF8
sub_08010DF8: @ 0x08010DF8
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	ldr r6, [r0, #4]
	ldr r4, [r0, #8]
	adds r1, r3, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _08010E14
	movs r0, #0
	b _08010E42
_08010E14:
	adds r0, r3, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsb r2, [r0, r2]
	movs r1, #1
	rsbs r1, r1, #0
	adds r5, r0, #0
	cmp r2, r1
	bne _08010E32
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_08010D98
	b _08010E3C
_08010E32:
	adds r0, r4, #0
	movs r1, #0
	adds r2, r6, #0
	bl sub_08010AF8
_08010E3C:
	movs r0, #0x61
	strb r0, [r5]
	movs r0, #2
_08010E42:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	thumb_func_start sub_08010E48
sub_08010E48: @ 0x08010E48
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r7, _08010EFC @ =0x03002870
	movs r6, #1
	ldrb r0, [r7, #1]
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r7, #1]
	adds r2, r7, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x44
	movs r4, #0
	strb r4, [r0]
	adds r1, r7, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r7, #0
	adds r0, #0x46
	strb r4, [r0]
	ldr r0, _08010F00 @ =0x0000FFE0
	ldrh r3, [r7, #0x3c]
	ands r0, r3
	movs r1, #4
	orrs r0, r1
	ldr r1, _08010F04 @ =0x0000E0FF
	ands r0, r1
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r7, #0x3c]
	movs r0, #0x20
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r7, #0
	adds r1, #0x3d
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ldrb r3, [r7, #0xc]
	ands r0, r3
	strb r0, [r7, #0xc]
	adds r0, r1, #0
	ldrb r2, [r7, #0x10]
	ands r0, r2
	orrs r0, r6
	strb r0, [r7, #0x10]
	ldrb r3, [r7, #0x14]
	ands r1, r3
	strb r1, [r7, #0x14]
	movs r0, #3
	ldrb r1, [r7, #0x18]
	orrs r0, r1
	strb r0, [r7, #0x18]
	movs r0, #6
	str r0, [r5, #0x44]
	str r4, [r5, #0x30]
	ldr r0, _08010F08 @ =0x08B90D88
	bl Proc_Find
	str r0, [r5, #0x40]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08010EFC: .4byte 0x03002870
_08010F00: .4byte 0x0000FFE0
_08010F04: .4byte 0x0000E0FF
_08010F08: .4byte 0x08B90D88

	thumb_func_start sub_08010F0C
sub_08010F0C: @ 0x08010F0C
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08010F98 @ =0x06008000
	ldr r1, _08010F9C @ =0x06001000
	movs r2, #0xa0
	lsls r2, r2, #5
	bl CpuFastSet
	ldr r0, _08010FA0 @ =0x02022960
	ldr r2, _08010FA4 @ =0xFFFFFF00
	adds r1, r0, r2
	ldr r2, [r4, #0x44]
	lsls r2, r2, #3
	ldr r3, _08010FA8 @ =0x001FFFFF
	ands r2, r3
	bl CpuFastSet
	ldr r5, _08010FAC @ =0x00008080
	adds r3, r5, #0
	ldr r2, _08010FB0 @ =0x02024460
	ldr r1, _08010FB4 @ =0x02023C60
	movs r4, #0x80
	lsls r4, r4, #3
_08010F3A:
	ldrh r5, [r2]
	adds r0, r3, r5
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _08010F3A
	movs r0, #4
	bl EnableBgSync
	bl EnablePalSync
	ldr r3, _08010FB8 @ =0x03002870
	movs r0, #1
	ldrb r1, [r3, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r5, [r2]
	ands r0, r5
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x44
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08010F98: .4byte 0x06008000
_08010F9C: .4byte 0x06001000
_08010FA0: .4byte 0x02022960
_08010FA4: .4byte 0xFFFFFF00
_08010FA8: .4byte 0x001FFFFF
_08010FAC: .4byte 0x00008080
_08010FB0: .4byte 0x02024460
_08010FB4: .4byte 0x02023C60
_08010FB8: .4byte 0x03002870

	thumb_func_start sub_08010FBC
sub_08010FBC: @ 0x08010FBC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08011004 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl UnpackChapterMapGraphics
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl RenderMap
	bl RefreshUnitSprites
	bl ApplyUnitSpritePalettes
	ldr r0, [r5, #0x34]
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08010FEC
	bl sub_08024CE0
_08010FEC:
	bl ForceSyncUnitSpriteSheet
	bl UnlockBmDisplay
	bl ReleaseMus
	movs r0, #8
	bl EnableBgSync
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011004: .4byte 0x0202BBF8

	thumb_func_start sub_08011008
sub_08011008: @ 0x08011008
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x30]
	ldr r0, [r4, #0x38]
	adds r2, r2, r0
	str r2, [r4, #0x30]
	asrs r2, r2, #4
	ldr r0, _08011050 @ =0x03002870
	mov ip, r0
	mov r3, ip
	adds r3, #0x3c
	movs r0, #0x3f
	ldrb r1, [r3]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r3]
	movs r0, #0x10
	subs r0, r0, r2
	mov r1, ip
	adds r1, #0x44
	movs r3, #0
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r3, [r0]
	cmp r2, #0x10
	bne _0801104A
	adds r0, r4, #0
	bl Proc_Break
_0801104A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08011050: .4byte 0x03002870

	thumb_func_start sub_08011054
sub_08011054: @ 0x08011054
	push {lr}
	ldr r0, _08011094 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r3, _08011098 @ =0x03002870
	adds r1, r3, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	adds r1, #8
	movs r2, #0
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x45
	strb r2, [r0]
	adds r0, #1
	strb r2, [r0]
	bl InitBmBgLayers
	bl ApplySystemGraphics
	bl InitSystemTextFont
	pop {r0}
	bx r0
	.align 2, 0
_08011094: .4byte 0x02023C60
_08011098: .4byte 0x03002870

	thumb_func_start sub_0801109C
sub_0801109C: @ 0x0801109C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080110B4 @ =0x08B91FDC
	bl Proc_StartBlocking
	str r4, [r0, #0x34]
	movs r1, #0xff
	ands r1, r4
	str r1, [r0, #0x38]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080110B4: .4byte 0x08B91FDC

	thumb_func_start sub_080110B8
sub_080110B8: @ 0x080110B8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x30]
	ldr r2, [r0, #4]
	adds r1, r5, #0
	adds r1, #0x5e
	movs r0, #4
	ldrh r1, [r1]
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	cmp r6, #0
	beq _080110F8
	adds r4, r5, #0
	adds r4, #0x4c
	ldrb r2, [r4]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080110F4
	movs r0, #0xff
	strb r0, [r4]
	bl RefreshBMapGraphics
	bl UnlockBmDisplay
	bl ReleaseMus
_080110F4:
	movs r0, #0
	b _08011110
_080110F8:
	adds r4, r5, #0
	adds r4, #0x4c
	adds r0, r2, #0
	adds r1, r5, #0
	bl sub_0801109C
	movs r0, #0xff
	strb r0, [r4]
	adds r0, r5, #0
	adds r0, #0x4d
	strb r6, [r0]
	movs r0, #2
_08011110:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start EventSnowStormfx_Init
EventSnowStormfx_Init: @ 0x08011118
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r3, _080111B4 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r5, #0
	strb r5, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r5, [r0]
	ldr r0, _080111B8 @ =0x0000FFE0
	ldrh r2, [r3, #0x3c]
	ands r0, r2
	movs r1, #4
	orrs r0, r1
	ldr r1, _080111BC @ =0x0000E0FF
	ands r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r3, #0x3c]
	ldr r0, _080111C0 @ =0x0819D22C
	ldr r1, _080111C4 @ =0x06001000
	bl Decompress
	ldr r4, _080111C8 @ =0x0819D6E4
	movs r1, #0xf0
	lsls r1, r1, #1
	adds r0, r4, #0
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _080111CC @ =0x02023C60
	ldr r1, _080111D0 @ =0x0819D724
	ldr r2, _080111D4 @ =0x0000F080
	bl sub_080AACD8
	movs r0, #4
	bl EnableBgSync
	adds r1, r4, #0
	adds r1, #0x20
	movs r0, #1
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0xf
	bl StartMixPalette
	str r5, [r6, #0x30]
	movs r0, #0x20
	str r0, [r6, #0x34]
	str r5, [r6, #0x3c]
	str r5, [r6, #0x40]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080111B4: .4byte 0x03002870
_080111B8: .4byte 0x0000FFE0
_080111BC: .4byte 0x0000E0FF
_080111C0: .4byte 0x0819D22C
_080111C4: .4byte 0x06001000
_080111C8: .4byte 0x0819D6E4
_080111CC: .4byte 0x02023C60
_080111D0: .4byte 0x0819D724
_080111D4: .4byte 0x0000F080

	thumb_func_start EventSnowStormfx_Loop1
EventSnowStormfx_Loop1: @ 0x080111D8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #1
	ldr r3, _08011254 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x44
	movs r2, #0
	strb r5, [r0]
	movs r0, #0x10
	subs r0, r0, r5
	cmp r0, #0xd
	bge _08011208
	movs r0, #0xd
_08011208:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r2, [r0]
	cmp r5, #0x10
	bne _08011220
	str r2, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011220:
	ldr r3, [r4, #0x34]
	adds r3, #1
	str r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011254: .4byte 0x03002870

	thumb_func_start EventSnowStormfx_Loop2
EventSnowStormfx_Loop2: @ 0x08011258
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	ldr r1, [r4, #0x2c]
	cmp r0, r1
	blt _08011272
	movs r0, #0
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl Proc_Break
_08011272:
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	pop {r4}
	pop {r0}
	bx r0

	thumb_func_start EventSnowStormfx_Loop3
EventSnowStormfx_Loop3: @ 0x080112A0
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	asrs r5, r0, #3
	ldr r3, _08011318 @ =0x03002870
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0x10
	subs r0, r0, r5
	adds r1, r3, #0
	adds r1, #0x44
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0xd
	cmp r0, #0x10
	ble _080112D2
	movs r0, #0x10
_080112D2:
	adds r1, r3, #0
	adds r1, #0x45
	strb r0, [r1]
	adds r1, #1
	movs r0, #0
	strb r0, [r1]
	ldr r3, [r4, #0x34]
	lsls r0, r3, #1
	adds r0, r0, r3
	ldr r1, [r4, #0x3c]
	adds r1, r1, r0
	str r1, [r4, #0x3c]
	ldr r2, [r4, #0x40]
	adds r2, r2, r3
	str r2, [r4, #0x40]
	asrs r1, r1, #5
	rsbs r1, r1, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	asrs r2, r2, #5
	rsbs r2, r2, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	bl SetBgOffset
	cmp r5, #0x10
	bne _08011310
	adds r0, r4, #0
	bl Proc_Break
_08011310:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011318: .4byte 0x03002870

	thumb_func_start EventSnowStormfx_End
EventSnowStormfx_End: @ 0x0801131C
	push {lr}
	ldr r0, _08011354 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r2, _08011358 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	pop {r0}
	bx r0
	.align 2, 0
_08011354: .4byte 0x02023C60
_08011358: .4byte 0x03002870

	thumb_func_start EventDF_SnowStormfx
EventDF_SnowStormfx: @ 0x0801135C
	push {r4, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011384
	ldr r0, _08011380 @ =0x08B92034
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	movs r0, #2
	b _08011386
	.align 2, 0
_08011380: .4byte 0x08B92034
_08011384:
	movs r0, #0
_08011386:
	pop {r4}
	pop {r1}
	bx r1

	thumb_func_start sub_0801138C
sub_0801138C: @ 0x0801138C
	push {r4, r5, lr}
	sub sp, #0x14
	ldr r5, _08011420 @ =0x03002870
	movs r2, #4
	rsbs r2, r2, #0
	adds r1, r2, #0
	ldrb r3, [r5, #0xc]
	ands r1, r3
	strb r1, [r5, #0xc]
	adds r1, r2, #0
	ldrb r3, [r5, #0x10]
	ands r1, r3
	movs r3, #1
	orrs r1, r3
	strb r1, [r5, #0x10]
	ldrb r1, [r5, #0x14]
	ands r2, r1
	strb r2, [r5, #0x14]
	movs r1, #3
	ldrb r2, [r5, #0x18]
	orrs r1, r2
	strb r1, [r5, #0x18]
	adds r3, r5, #0
	adds r3, #0x3c
	movs r1, #0x3f
	ldrb r2, [r3]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r3]
	adds r2, r5, #0
	adds r2, #0x44
	movs r4, #0
	movs r1, #0x10
	strb r1, [r2]
	adds r2, #1
	strb r1, [r2]
	adds r1, r5, #0
	adds r1, #0x46
	strb r4, [r1]
	ldr r1, _08011424 @ =0x0000FFE0
	ldrh r3, [r5, #0x3c]
	ands r1, r3
	movs r2, #4
	orrs r1, r2
	ldr r2, _08011428 @ =0x0000E0FF
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #5
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r5, #0x3c]
	str r4, [r0, #0x30]
	ldr r5, _0801142C @ =0x08B92074
	ldr r2, [r0, #0x3c]
	adds r2, #0x54
	ldr r3, [r0, #0x40]
	str r4, [sp]
	movs r1, #0x80
	lsls r1, r1, #6
	str r1, [sp, #4]
	movs r1, #0xf
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r0, [sp, #0x10]
	adds r0, r5, #0
	movs r1, #2
	bl StartBmBgfx
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08011420: .4byte 0x03002870
_08011424: .4byte 0x0000FFE0
_08011428: .4byte 0x0000E0FF
_0801142C: .4byte 0x08B92074

	thumb_func_start sub_08011430
sub_08011430: @ 0x08011430
	push {lr}
	ldr r2, _08011460 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r3, r2, #0
	adds r3, #0x45
	movs r0, #0x10
	strb r0, [r3]
	adds r0, r2, #0
	adds r0, #0x46
	strb r1, [r0]
	bl InitBmBgLayers
	pop {r0}
	bx r0
	.align 2, 0
_08011460: .4byte 0x03002870

	thumb_func_start sub_08011464
sub_08011464: @ 0x08011464
	push {r4, r5, lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x30]
	ldr r4, [r0, #4]
	ldr r5, [r0, #8]
	adds r2, r1, #0
	adds r2, #0x5e
	movs r0, #4
	ldrh r2, [r2]
	ands r0, r2
	cmp r0, #0
	bne _08011490
	ldr r0, _0801148C @ =0x08B92140
	bl Proc_StartBlocking
	str r4, [r0, #0x3c]
	str r5, [r0, #0x40]
	movs r0, #2
	b _08011492
	.align 2, 0
_0801148C: .4byte 0x08B92140
_08011490:
	movs r0, #0
_08011492:
	pop {r4, r5}
	pop {r1}
	bx r1

	thumb_func_start sub_08011498
sub_08011498: @ 0x08011498
	push {lr}
	ldr r0, _080114A8 @ =0x08B92140
	bl Proc_Find
	cmp r0, #0
	bne _080114AC
	movs r0, #0
	b _080114AE
	.align 2, 0
_080114A8: .4byte 0x08B92140
_080114AC:
	movs r0, #1
_080114AE:
	pop {r1}
	bx r1
	.align 2, 0

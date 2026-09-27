	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08060E18
sub_08060E18: @ 0x08060E18
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08060E54
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBG_A
	ldr r0, _08060E50 @ =0x000002C1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08060EB6
	.align 2, 0
_08060E50: .4byte 0x000002C1
_08060E54:
	cmp r0, #0xe
	bne _08060E60
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBG_B
	b _08060F66
_08060E60:
	cmp r0, #0x2c
	bne _08060E78
	ldr r0, _08060E74 @ =0x000002C2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08060EB6
	.align 2, 0
_08060E74: .4byte 0x000002C2
_08060E78:
	cmp r0, #0x53
	bne _08060E90
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _08060F66
_08060E90:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x5d
	cmp r1, r0
	bne _08060EA4
	adds r0, r5, #0
	bl sub_08061098
	b _08060F66
_08060EA4:
	adds r0, r2, #0
	adds r0, #0x67
	cmp r1, r0
	bne _08060EC4
	ldr r0, _08060EC0 @ =0x000002C3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_08060EB6:
	movs r3, #1
	bl PlaySFX
	b _08060F66
	.align 2, 0
_08060EC0: .4byte 0x000002C3
_08060EC4:
	adds r0, r2, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _08060ED8
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	b _08060F48
_08060ED8:
	adds r0, r2, #0
	adds r0, #0x89
	cmp r1, r0
	bne _08060EEE
	adds r0, r5, #0
	bl sub_08061184
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBGCOL
	b _08060F66
_08060EEE:
	adds r0, r2, #0
	adds r0, #0x90
	cmp r1, r0
	bne _08060F1E
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08060F66
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _08060F66
_08060F1E:
	adds r0, r2, #0
	adds r0, #0x9a
	cmp r1, r0
	bne _08060F50
	ldr r0, [r4, #0x5c]
	movs r1, #0x55
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x38
	bl NewEfxTwobaiRST
	adds r0, r5, #0
	bl StartSubSpell_efxOuraBG3
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0xc
_08060F48:
	movs r3, #0x10
	bl NewEfxALPHA
	b _08060F66
_08060F50:
	adds r0, r2, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _08060F66
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_08060F66:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

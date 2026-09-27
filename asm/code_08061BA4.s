	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08061BA4
sub_08061BA4: @ 0x08061BA4
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08061BD2
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_08061BD2:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0x14
	cmp r1, r0
	bne _08061BEC
	adds r0, r6, #0
	bl sub_08062254
	ldr r0, _08061BE8 @ =0x000002FD
	b _08061C8C
	.align 2, 0
_08061BE8: .4byte 0x000002FD
_08061BEC:
	adds r0, r5, #0
	adds r0, #0x28
	cmp r1, r0
	bne _08061C0C
	adds r0, r6, #0
	bl sub_08061F08
	adds r0, r6, #0
	bl sub_08061D24
	adds r0, r6, #0
	bl sub_08061E70
	bl sub_0804FD54
	b _08061D18
_08061C0C:
	adds r0, r5, #0
	adds r0, #0x91
	cmp r1, r0
	bne _08061C20
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0x14
	bl sub_08062108
	b _08061D18
_08061C20:
	adds r0, r5, #0
	adds r0, #0xaf
	cmp r1, r0
	bne _08061C48
	movs r0, #9
	ldrh r1, [r6, #0x10]
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08061D18
	adds r0, r6, #0
	bl EfxPlayHittedSFX
	b _08061D18
_08061C48:
	adds r0, r5, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _08061C6A
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08061D18
	bl SpellFx_Finish
	bl sub_0804FD6C
	adds r0, r4, #0
	bl Proc_Break
	b _08061D18
_08061C6A:
	adds r0, r5, #0
	adds r0, #0xb1
	cmp r1, r0
	bne _08061CA0
	ldr r0, [r4, #0x5c]
	movs r1, #0x50
	movs r2, #9
	bl StartSpellThing_MagicQuake
	adds r0, r6, #0
	movs r1, #0x1e
	bl StartSubSpell_efxGespenstBG4
	adds r0, r6, #0
	bl StartSubSpell_efxGespenstBGCOL2
	ldr r0, _08061C9C @ =0x000002FE
_08061C8C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _08061D18
	.align 2, 0
_08061C9C: .4byte 0x000002FE
_08061CA0:
	adds r0, r5, #0
	adds r0, #0xcd
	cmp r1, r0
	bne _08061CB2
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	b _08061D18
_08061CB2:
	adds r0, r5, #0
	adds r0, #0xd7
	cmp r1, r0
	bne _08061CE4
	ldr r0, [r4, #0x5c]
	movs r1, #0x46
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x32
	bl NewEfxTwobaiRST
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxSuperdruidBG3
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl NewEfxALPHA
	b _08061D18
_08061CE4:
	adds r0, r5, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _08061CF4
	adds r0, r6, #0
	bl sub_080621E4
	b _08061D18
_08061CF4:
	adds r0, r5, #0
	adds r0, #0xf0
	cmp r1, r0
	bne _08061D02
	bl sub_0804FD6C
	b _08061D18
_08061D02:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	ldr r2, _08061D20 @ =0x0000010B
	adds r0, r5, r2
	cmp r1, r0
	bne _08061D18
	bl SpellFx_Finish
	adds r0, r4, #0
	bl Proc_Break
_08061D18:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08061D20: .4byte 0x0000010B

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805A42C
sub_0805A42C: @ 0x0805A42C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	mov r8, r0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805A45E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805A45E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #1
	cmp r1, r0
	bne _0805A480
	adds r0, r5, #0
	movs r1, #0x82
	bl sub_0805AB44
	ldr r0, _0805A4A4 @ =0x000002CA
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_0805A480:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0x32
	movs r2, #0x29
	adds r2, r2, r6
	mov sb, r2
	cmp r1, r0
	bne _0805A4FE
	ldrb r0, [r2]
	cmp r0, #0
	bne _0805A4A8
	adds r0, r5, #0
	movs r1, #0xcd
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	b _0805A4B2
	.align 2, 0
_0805A4A4: .4byte 0x000002CA
_0805A4A8:
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
_0805A4B2:
	adds r0, r5, #0
	movs r1, #0x28
	bl sub_0805AA7C
	ldr r3, _0805A5DC @ =0x03002870
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
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r4, [r0]
	str r1, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #8
	movs r3, #0
	bl NewEfxALPHA
	str r4, [sp]
	str r4, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x20
	movs r2, #8
	movs r3, #0x10
	bl NewEfxALPHA
_0805A4FE:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0x64
	cmp r1, r0
	bne _0805A51A
	adds r0, r5, #0
	movs r1, #0x34
	bl sub_0805A62C
	adds r0, r5, #0
	movs r1, #0x34
	bl sub_0805A6F8
_0805A51A:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x78
	cmp r1, r0
	bne _0805A530
	adds r0, r5, #0
	movs r1, #0x23
	movs r2, #0x19
	bl sub_0805ADF0
_0805A530:
	mov r2, sb
	ldrb r7, [r2]
	cmp r7, #0
	bne _0805A5E4
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x9b
	cmp r1, r0
	bne _0805A5C0
	movs r0, #9
	movs r4, #0
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	ldrb r1, [r2]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_0805A864
	ldr r3, _0805A5DC @ =0x03002870
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
	strb r4, [r0]
	adds r1, r3, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x46
	strb r4, [r0]
	movs r0, #0xc
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #5
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0x1e
	movs r3, #0xc
	bl NewEfxALPHA
	adds r0, r5, #0
	bl sub_0805A78C
	ldr r0, _0805A5E0 @ =0x000002CB
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
_0805A5C0:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	mov r0, r8
	adds r0, #0xff
	cmp r1, r0
	bne _0805A61C
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
	b _0805A61C
	.align 2, 0
_0805A5DC: .4byte 0x03002870
_0805A5E0: .4byte 0x000002CB
_0805A5E4:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0x9b
	cmp r1, r0
	bne _0805A602
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	mov r2, sb
	ldrb r1, [r2]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
_0805A602:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	mov r0, r8
	adds r0, #0xa0
	cmp r1, r0
	bne _0805A61C
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0805A61C:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

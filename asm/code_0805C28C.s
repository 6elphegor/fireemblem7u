	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805C28C
sub_0805C28C: @ 0x0805C28C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805C2C2
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl NewEfxFarAttackWithDistance
_0805C2C2:
	movs r2, #0x2c
	ldrsh r1, [r6, r2]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805C354
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805C470
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805C54C
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl NewEfxRestWINH_
	ldr r3, _0805C350 @ =0x03002870
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
	mov r2, r8
	strb r2, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r2, [r0]
	str r1, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl NewEfxALPHA
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl NewEfxALPHA
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	b _0805C464
	.align 2, 0
_0805C350: .4byte 0x03002870
_0805C354:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne _0805C36C
	adds r0, r5, #0
	movs r1, #0x4a
	bl StartSubSpell_efxFenrirOBJ
	ldr r0, _0805C368 @ =0x00000131
	b _0805C3C4
	.align 2, 0
_0805C368: .4byte 0x00000131
_0805C36C:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _0805C37C
	adds r0, r5, #0
	bl StartSubSpell_efxFenrirBG2_A
	b _0805C464
_0805C37C:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0xb5
	cmp r1, r0
	beq _0805C3C0
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _0805C3C0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _0805C3D4
_0805C3C0:
	movs r0, #0x99
	lsls r0, r0, #1
_0805C3C4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805C464
_0805C3D4:
	adds r0, r4, #0
	adds r0, #0xee
	cmp r1, r0
	bne _0805C420
	adds r0, r5, #0
	movs r1, #0xa
	bl NewEfxFlashBgWhite
	adds r0, r5, #0
	bl StartSubSpell_efxFenrirOBJ2
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _0805C41C @ =0x00000133
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805C464
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805C464
	.align 2, 0
_0805C41C: .4byte 0x00000133
_0805C420:
	adds r0, r4, #0
	adds r0, #0xf8
	cmp r1, r0
	bne _0805C442
	adds r0, r5, #0
	bl StartSubSpell_efxFenrirBG2_B
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805C464
_0805C442:
	movs r2, #0x91
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	beq _0805C464
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	bne _0805C464
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0805C464:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

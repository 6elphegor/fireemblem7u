	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805F43C
sub_0805F43C: @ 0x0805F43C
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
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F470
	ldr r0, [r6, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_0805F470:
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #1
	cmp r1, r0
	bne _0805F50C
	adds r0, r5, #0
	bl sub_0805F638
	ldr r6, _0805F504 @ =0x03002870
	movs r0, #0x21
	rsbs r0, r0, #0
	ldrb r1, [r6, #1]
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x3f
	ldrb r3, [r2]
	ands r0, r3
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x44
	strb r7, [r0]
	adds r1, r6, #0
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	adds r1, #1
	strb r7, [r1]
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x14
	movs r2, #0xf
	adds r3, r4, #0
	bl NewefxRestRST
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x14
	bl sub_0805FD44
	movs r1, #0x20
	ldrsh r2, [r6, r1]
	adds r0, r5, #0
	movs r1, #0x14
	movs r3, #0
	bl NewEfxRestWINH
	ldr r0, _0805F508 @ =0x000002BD
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #1
	bl PlaySFX
	b _0805F62A
	.align 2, 0
_0805F504: .4byte 0x03002870
_0805F508: .4byte 0x000002BD
_0805F50C:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _0805F53C
	bl sub_0805F6EC
	adds r0, r5, #0
	movs r1, #0x15
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r5, #0
	bl StartSubSpell_efxLunaOBJ
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0x10
	bl NewEfxALPHA
	b _0805F62A
_0805F53C:
	adds r0, r4, #0
	adds r0, #0x37
	cmp r1, r0
	bne _0805F55C
	ldr r0, _0805F558 @ =0x000002BE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #0
	bl PlaySFX
	b _0805F62A
	.align 2, 0
_0805F558: .4byte 0x000002BE
_0805F55C:
	adds r0, r4, #0
	adds r0, #0x46
	cmp r1, r0
	bne _0805F5C8
	adds r0, r5, #0
	movs r1, #0x41
	bl sub_0805F82C
	adds r0, r5, #0
	movs r1, #0x41
	bl sub_0805F968
	ldr r3, _0805F5C4 @ =0x03002870
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
	strb r7, [r0]
	adds r0, #1
	movs r1, #0x10
	strb r1, [r0]
	adds r0, #1
	strb r7, [r0]
	str r1, [sp]
	mov r3, r8
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl NewEfxALPHA
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x41
	movs r2, #2
	movs r3, #0x80
	bl NewefxRestRST
	adds r0, r5, #0
	movs r1, #0x44
	movs r2, #0
	bl NewEfxRestWINH_
	b _0805F62A
	.align 2, 0
_0805F5C4: .4byte 0x03002870
_0805F5C8:
	adds r0, r4, #0
	adds r0, #0x87
	cmp r1, r0
	bne _0805F5FA
	adds r0, r5, #0
	movs r1, #5
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805F62A
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805F62A
_0805F5FA:
	adds r0, r4, #0
	adds r0, #0x8c
	cmp r1, r0
	bne _0805F614
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	ldr r0, [r6, #0x5c]
	bl StartSubSpell_efxLunaBG3
	b _0805F62A
_0805F614:
	adds r0, r4, #0
	adds r0, #0xbe
	cmp r1, r0
	bne _0805F62A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl Proc_Break
_0805F62A:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

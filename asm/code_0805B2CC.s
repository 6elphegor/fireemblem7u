	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805B2CC
sub_0805B2CC: @ 0x0805B2CC
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	movs r1, #0
	mov r8, r1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805B300
	ldr r0, [r4, #0x5c]
	subs r1, #1
	bl NewEfxFarAttackWithDistance
_0805B300:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805B358
	adds r0, r5, #0
	bl sub_0805B438
	ldr r3, _0805B354 @ =0x03002870
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
	mov r2, r8
	str r2, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl NewEfxALPHA
	adds r0, r5, #0
	movs r1, #0xaa
	bl sub_0805B6F4
	movs r0, #0x95
	lsls r0, r0, #1
	b _0805B362
	.align 2, 0
_0805B354: .4byte 0x03002870
_0805B358:
	ldr r2, _0805B374 @ =0x0000011B
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B37C
	ldr r0, _0805B378 @ =0x0000012B
_0805B362:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl PlaySFX
	b _0805B42C
	.align 2, 0
_0805B374: .4byte 0x0000011B
_0805B378: .4byte 0x0000012B
_0805B37C:
	ldr r2, _0805B390 @ =0x0000013B
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B394
	adds r0, r5, #0
	movs r1, #0x19
	bl sub_0805B8F4
	b _0805B42C
	.align 2, 0
_0805B390: .4byte 0x0000013B
_0805B394:
	movs r3, #0xaa
	lsls r3, r3, #1
	adds r0, r6, r3
	cmp r1, r0
	bne _0805B3C6
	adds r0, r5, #0
	movs r1, #0xc
	bl NewEfxFlashBgWhite
	movs r0, #9
	ldrh r1, [r5, #0x10]
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl sub_08050150
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805B42C
	adds r0, r5, #0
	bl EfxPlayHittedSFX
	b _0805B42C
_0805B3C6:
	movs r2, #0xad
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B414
	movs r0, #0x96
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl PlaySFX
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl StartSpellThing_MagicQuake
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805B534
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_0805B660
	mov r3, r8
	str r3, [sp]
	str r3, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0x1e
	movs r3, #0x10
	bl NewEfxALPHA
	adds r0, r5, #0
	bl sub_0805BA48
	b _0805B42C
_0805B414:
	movs r2, #0xf5
	lsls r2, r2, #1
	adds r0, r6, r2
	cmp r1, r0
	bne _0805B42C
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl Proc_Break
_0805B42C:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

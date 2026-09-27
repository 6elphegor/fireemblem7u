	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D4D4
sub_0809D4D4: @ 0x0809D4D4
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl InitFaces
	bl ResetText
	bl InitIcons
	ldr r0, _0809D584 @ =0x02022C60
	movs r1, #0
	bl TmFill
	ldr r4, _0809D588 @ =0x02023460
	adds r0, r4, #0
	movs r1, #0
	bl TmFill
	ldr r0, _0809D58C @ =0x02023C60
	movs r1, #0
	bl TmFill
	adds r2, r5, #0
	adds r2, #0x39
	movs r0, #0xfc
	ldrb r1, [r2]
	ands r0, r1
	movs r1, #0xe3
	ands r0, r1
	strb r0, [r2]
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	bl GetSupportScreenPartnerCount
	adds r1, r5, #0
	adds r1, #0x3c
	strb r0, [r1]
	adds r0, r5, #0
	bl InitSupportSubScreenPartners
	adds r0, r5, #0
	bl InitSupportSubScreenPartnerLevels
	adds r0, r5, #0
	bl InitSupportSubScreenRemainingSupports
	adds r0, r5, #0
	movs r1, #0
	movs r2, #1
	bl SupportSubScreen_MoveCursorToNextValidUnit
	ldr r1, _0809D590 @ =0x0840ECC4
	movs r2, #0xa4
	lsls r2, r2, #7
	adds r0, r4, #0
	bl sub_080AACD8
	ldr r4, _0809D594 @ =0x08BDCE4C
	ldr r0, [r5, #0x2c]
	bl GetSupportScreenCharIdAt
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	adds r0, r0, r4
	ldrh r4, [r0, #6]
	adds r0, r4, #0
	bl ShouldFaceBeRaised
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D598
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #0
	strb r0, [r1]
	movs r0, #0x80
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #0
	bl StartBmFace
	b _0809D5B0
	.align 2, 0
_0809D584: .4byte 0x02022C60
_0809D588: .4byte 0x02023460
_0809D58C: .4byte 0x02023C60
_0809D590: .4byte 0x0840ECC4
_0809D594: .4byte 0x08BDCE4C
_0809D598:
	adds r1, r5, #0
	adds r1, #0x3f
	movs r0, #8
	strb r0, [r1]
	adds r0, #0xfc
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x38
	movs r3, #8
	bl StartBmFace
_0809D5B0:
	adds r0, r5, #0
	bl DrawSupportSubScreenUnitPartnerDetails
	adds r0, r5, #0
	bl DrawSupportSubScreenRemainingText
	bl sub_0809C49C
	adds r1, r5, #0
	adds r1, #0x3a
	movs r0, #0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

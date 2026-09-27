	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075C90
sub_08075C90: @ 0x08075C90
	push {r4, r7, lr}
	sub sp, #0x14
	mov r7, sp
	str r0, [r7]
	ldr r1, _08075CC4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #8]
	ldr r1, _08075CC4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075CC8
	ldr r1, _08075CC4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x58
	ldrb r0, [r1]
	str r0, [r7, #0xc]
	b _08075CD2
	.align 2, 0
_08075CC4: .4byte 0x0203E0FC
_08075CC8:
	ldr r1, _08075D28 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x59
	ldrb r0, [r1]
	str r0, [r7, #0xc]
_08075CD2:
	ldr r0, _08075D28 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocReturnBool
	lsls r1, r0, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	bne _08075D2C
	ldr r1, _08075D28 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075D26
	ldr r0, _08075D28 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartManimMissAnim
_08075D26:
	b _0807603E
	.align 2, 0
_08075D28: .4byte 0x0203E0FC
_08075D2C:
	ldr r0, _08075D90 @ =0x0203E0FC
	adds r1, r0, #0
	adds r0, #0x5f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #1
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	ldr r2, _08075D90 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	bl sub_08076050
	ldr r1, _08075D90 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075D80
	ldr r0, [r7, #8]
	ldr r2, _08075D90 @ =0x0203E0FC
	adds r1, r2, #0
	adds r2, #0x5d
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r2, r1, #0
	adds r1, r2, #0
	bl sub_08076050
_08075D80:
	ldr r1, _08075D90 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _08075D94
	b _0807603E
	.align 2, 0
_08075D90: .4byte 0x0203E0FC
_08075D94:
	ldr r1, _08075DE8 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075DF0
	ldr r0, _08075DE8 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08075DEC @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xc8
	bl PlaySeSpacial
	ldr r0, _08075DE8 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartManimMissAnim
	b _0807603E
	.align 2, 0
_08075DE8: .4byte 0x0203E0FC
_08075DEC: .4byte 0x0202BBB8
_08075DF0:
	ldr r1, _08075E3C @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5d
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08075E48
	ldr r0, _08075E40 @ =0x000002CE
	ldr r1, _08075E3C @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075E44 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	ldr r0, _08075E3C @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	bl StartManimNoDamageAnim
	b _0807603E
	.align 2, 0
_08075E3C: .4byte 0x0203E0FC
_08075E40: .4byte 0x000002CE
_08075E44: .4byte 0x0202BBB8
_08075E48:
	movs r0, #0
	ldr r1, _08075E88 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x1b
	beq _08075E8C
	ldr r1, _08075E88 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, #4
	adds r2, r1, r2
	ldr r3, [r2]
	adds r1, r3, #0
	adds r2, r3, #0
	adds r2, #0x55
	ldrb r1, [r2]
	cmp r1, #0x33
	beq _08075E8C
	b _08075E8E
	.align 2, 0
_08075E88: .4byte 0x0203E0FC
_08075E8C:
	movs r0, #1
_08075E8E:
	str r0, [r7, #0x10]
	ldr r0, [r7, #0x10]
	cmp r0, #0
	beq _08075EF4
	ldr r1, _08075ECC @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08075ED0
	movs r0, #0xaf
	str r0, [r7, #4]
	ldr r0, _08075ECC @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #1
	bl StartManimWallBreakAnim
	b _08075EEC
	.align 2, 0
_08075ECC: .4byte 0x0203E0FC
_08075ED0:
	movs r0, #0xb0
	str r0, [r7, #4]
	ldr r0, _08075EF0 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r1, #0
	movs r1, #0
	bl StartManimWallBreakAnim
_08075EEC:
	b _08075F18
	.align 2, 0
_08075EF0: .4byte 0x0203E0FC
_08075EF4:
	ldr r1, _08075F10 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5c
	ldrb r0, [r1]
	movs r1, #2
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x18
	lsrs r0, r1, #0x18
	cmp r0, #0
	beq _08075F14
	movs r0, #0xd5
	str r0, [r7, #4]
	b _08075F18
	.align 2, 0
_08075F10: .4byte 0x0203E0FC
_08075F14:
	movs r0, #0xd2
	str r0, [r7, #4]
_08075F18:
	ldr r1, _08075FD4 @ =0x0203E0FC
	adds r0, r1, #0
	adds r1, #0x5a
	ldrh r0, [r1]
	movs r1, #1
	ands r0, r1
	adds r2, r0, #0
	lsls r1, r2, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0
	beq _08075FDC
	ldr r0, [r7, #4]
	ldr r1, _08075FD4 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _08075FD8 @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFlashColor
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl StartMuCritFlash
	bl StartManimBgShaker
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	adds r1, r0, #0
	lsls r0, r1, #4
	ldr r1, _08075FD8 @ =0x0202BBB8
	movs r3, #0xc
	ldrsh r2, [r1, r3]
	subs r1, r0, r2
	movs r0, #0xd8
	bl PlaySeSpacial
	ldr r0, _08075FD4 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	bl StartMuSpeedUpAnim
	b _0807603E
	.align 2, 0
_08075FD4: .4byte 0x0203E0FC
_08075FD8: .4byte 0x0202BBB8
_08075FDC:
	ldr r0, [r7, #4]
	ldr r1, _08076048 @ =0x0203E0FC
	ldr r2, [r7, #0xc]
	adds r4, r2, #0
	lsls r3, r4, #2
	adds r3, r3, r2
	lsls r2, r3, #2
	adds r1, r1, r2
	ldr r2, [r1]
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	adds r2, r1, #0
	lsls r1, r2, #4
	ldr r2, _0807604C @ =0x0202BBB8
	movs r4, #0xc
	ldrsh r3, [r2, r4]
	subs r1, r1, r3
	bl PlaySeSpacial
	ldr r0, _08076048 @ =0x0203E0FC
	ldr r1, [r7, #0xc]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #8
	adds r1, r0, r1
	ldr r4, [r1]
	ldr r0, _08076048 @ =0x0203E0FC
	ldr r1, [r7, #8]
	adds r3, r1, #0
	lsls r2, r3, #2
	adds r2, r2, r1
	lsls r1, r2, #2
	adds r0, #4
	adds r1, r0, r1
	ldr r2, [r1]
	adds r0, r2, #0
	adds r1, r2, #0
	adds r1, #0x4a
	ldrh r2, [r1]
	adds r0, r2, #0
	bl GetSpellAssocFlashColor
	lsls r2, r0, #0x18
	lsrs r1, r2, #0x18
	adds r0, r4, #0
	bl StartMuHitFlash
_0807603E:
	add sp, #0x14
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076048: .4byte 0x0203E0FC
_0807604C: .4byte 0x0202BBB8

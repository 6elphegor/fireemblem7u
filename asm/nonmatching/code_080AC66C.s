	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AC66C
sub_080AC66C: @ 0x080AC66C
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r6, [r7, #0x14]
	adds r4, r6, #0
	adds r4, #0x3c
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r0, r0, #3
	adds r0, #0x18
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_080AC3F8
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080AC712
	movs r0, #0
	ldrsb r0, [r4, r0]
	lsls r4, r0, #3
	adds r4, #0x30
	movs r5, #0xff
	ands r4, r5
	movs r2, #0xc
	subs r2, r2, r0
	lsls r2, r2, #3
	adds r2, #4
	ands r2, r5
	movs r0, #0x80
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, _080AC76C @ =0x08CE560C
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	movs r1, #4
	bl PutSpriteExt
	adds r2, r4, #1
	ands r2, r5
	ldr r3, _080AC770 @ =0x08CE562C
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	movs r1, #0x88
	bl PutSpriteExt
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #5
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r2, _080AC774 @ =0x08CE4D28
	adds r1, r6, #0
	adds r1, #0x32
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r2, #4
	adds r1, r1, r2
	ldr r1, [r1]
	adds r1, #0x78
	bl __divsi3
	adds r1, r0, #0
	adds r1, #0x88
	ldr r3, _080AC778 @ =0x08CE564C
	str r5, [sp]
	movs r0, #0
	adds r2, r4, #0
	bl PutSpriteExt
	ldrh r2, [r6, #0x2c]
	movs r0, #0x3c
	adds r1, r4, #0
	bl DrawMusicPlayerTime
_080AC712:
	adds r6, #0x3d
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ldr r5, _080AC77C @ =0x000001FF
	ands r1, r5
	ldr r3, _080AC780 @ =0x08CE55F4
	movs r4, #0x80
	lsls r4, r4, #7
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x58
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AC784 @ =0x08CE55FC
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x68
	bl PutSprite
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r1, r1, #3
	adds r1, #0x16
	ands r1, r5
	ldr r3, _080AC788 @ =0x08CE5604
	str r4, [sp]
	movs r0, #0xb
	movs r2, #0x78
	bl PutSprite
	adds r0, r7, #0
	bl sub_080AC54C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC76C: .4byte 0x08CE560C
_080AC770: .4byte 0x08CE562C
_080AC774: .4byte 0x08CE4D28
_080AC778: .4byte 0x08CE564C
_080AC77C: .4byte 0x000001FF
_080AC780: .4byte 0x08CE55F4
_080AC784: .4byte 0x08CE55FC
_080AC788: .4byte 0x08CE5604

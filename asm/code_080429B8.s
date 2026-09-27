	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080429B8
sub_080429B8: @ 0x080429B8
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x48]
	movs r1, #5
	bl sub_080428B8
	ldr r0, [r4, #0x48]
	cmp r5, r0
	beq _08042A36
	movs r0, #3
	bl SioPlaySoundEffect
	lsls r0, r5, #2
	adds r1, r4, #0
	adds r1, #0x2c
	adds r0, r1, r0
	ldr r3, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #1
	strb r0, [r2]
	ldr r0, [r4, #0x48]
	lsls r0, r0, #2
	adds r1, r1, r0
	ldr r3, [r1]
	adds r1, r3, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	movs r0, #0x2a
	ldrsh r1, [r3, r0]
	movs r0, #0x2c
	ldrsh r2, [r3, r0]
	adds r0, r3, #0
	bl sub_080489C0
	adds r0, r4, #0
	movs r1, #0
	bl SioMenu_GetItemHelpText
	movs r1, #0
	bl PutSioText
	adds r0, r4, #0
	movs r1, #1
	bl SioMenu_GetItemHelpText
	movs r1, #1
	bl PutSioText
	ldr r1, _08042A84 @ =0x081D541C
	ldr r0, [r4, #0x48]
	lsls r0, r0, #1
	adds r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r1, #8
	movs r0, #0
	bl sub_08047F50
	ldr r0, [r4, #0x48]
	bl sub_08047F8C
_08042A36:
	ldr r5, _08042A88 @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #1
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042A5A
	movs r0, #0
	str r0, [r4, #0x54]
	movs r0, #2
	bl SioPlaySoundEffect
	ldr r1, _08042A8C @ =0x0203D90C
	ldr r0, [r4, #0x48]
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08042A5A:
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08042A7E
	movs r0, #1
	bl SioPlaySoundEffect
	movs r0, #2
	bl FadeBgmOut
	ldr r1, _08042A8C @ =0x0203D90C
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_08042A7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042A84: .4byte 0x081D541C
_08042A88: .4byte 0x08B857F8
_08042A8C: .4byte 0x0203D90C

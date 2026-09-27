	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E714
sub_0803E714: @ 0x0803E714
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, _0803E7E0 @ =0x08B98C9C
	ldr r0, _0803E7E4 @ =0x0203D90C
	mov r8, r0
	ldrb r2, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r3, #0
	mov sl, r3
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl SioTeamList_Main_HandleDPadInput
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq _0803E792
	movs r0, #3
	bl SioPlaySoundEffect
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r3, r8
	ldrb r1, [r3]
	adds r0, r4, #0
	bl sub_0803E0D4
	adds r0, r4, #0
	bl sub_0803E454
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl PutSioText
_0803E792:
	ldr r0, _0803E7E8 @ =0x08B857F8
	ldr r1, [r0]
	adds r0, r7, #0
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803E824
	mov r0, r8
	ldrb r0, [r0]
	cmp r0, #1
	beq _0803E802
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0803E7FA
	lsls r0, r1, #4
	add r0, sb
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _0803E7EC
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r1, r8
	strb r0, [r1, #3]
	b _0803E880
	.align 2, 0
_0803E7E0: .4byte 0x08B98C9C
_0803E7E4: .4byte 0x0203D90C
_0803E7E8: .4byte 0x08B857F8
_0803E7EC:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r0, r4, #0
	bl Proc_Break
	b _0803E824
_0803E7FA:
	movs r0, #0
	bl SioPlaySoundEffect
	b _0803E824
_0803E802:
	movs r0, #2
	bl SioPlaySoundEffect
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r2, sl
	str r2, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _0803E880
_0803E824:
	ldr r5, _0803E890 @ =0x08B857F8
	ldr r1, [r5]
	movs r0, #2
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803E846
	movs r0, #1
	bl SioPlaySoundEffect
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, _0803E894 @ =0x0203D90C
	movs r0, #0xff
	strb r0, [r1, #3]
_0803E846:
	ldr r1, [r5]
	movs r0, #8
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _0803E880
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803E880
	ldr r0, _0803E898 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0803E872
	ldr r0, _0803E89C @ =0x0000038A
	bl m4aSongNumStart
_0803E872:
	ldr r1, _0803E894 @ =0x0203D90C
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_0803E880:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803E890: .4byte 0x08B857F8
_0803E894: .4byte 0x0203D90C
_0803E898: .4byte 0x0202BBF8
_0803E89C: .4byte 0x0000038A

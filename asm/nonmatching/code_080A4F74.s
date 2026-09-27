	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A4F74
sub_080A4F74: @ 0x080A4F74
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r5, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _080A5018 @ =0x08CE40F4
	ldr r1, [r4]
	ldr r2, _080A501C @ =0x01000142
	mov r0, sp
	bl CpuSet
	ldr r0, [r4]
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A500C
	movs r0, #0
	str r0, [r5, #0x5c]
	str r0, [r5, #0x58]
	mov r8, r4
	movs r6, #0
	movs r0, #0xfc
	mov sb, r0
	movs r7, #0x1f
_080A4FAE:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	movs r4, #3
	ldrb r2, [r1]
	ands r4, r2
	cmp r4, #1
	bne _080A4FF8
	ldrb r0, [r1, #1]
	cmp r0, #3
	bne _080A4FD8
	str r4, [r5, #0x58]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x75
	bl UnlockSoundRoomSong
_080A4FD8:
	mov r1, r8
	ldr r0, [r1]
	adds r1, r0, r6
	ldrb r2, [r1, #1]
	cmp r2, #4
	bne _080A4FF8
	str r4, [r5, #0x5c]
	mov r0, sb
	ldrb r2, [r1]
	ands r0, r2
	adds r0, #2
	strb r0, [r1]
	movs r0, #0
	movs r1, #0x76
	bl UnlockSoundRoomSong
_080A4FF8:
	adds r6, #0x14
	subs r7, #1
	cmp r7, #0
	bge _080A4FAE
	ldr r0, [r5, #0x58]
	cmp r0, #0
	bne _080A5020
	ldr r0, [r5, #0x5c]
	cmp r0, #0
	bne _080A5020
_080A500C:
	adds r0, r5, #0
	movs r1, #0xa
	bl Proc_Goto
	b _080A5028
	.align 2, 0
_080A5018: .4byte 0x08CE40F4
_080A501C: .4byte 0x01000142
_080A5020:
	ldr r0, _080A5038 @ =0x06013800
	movs r1, #9
	bl LoadHelpBoxGfx
_080A5028:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5038: .4byte 0x06013800

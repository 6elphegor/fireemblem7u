	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AAE40
sub_080AAE40: @ 0x080AAE40
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	bl sub_080AAD7C
	movs r1, #0x36
	adds r1, r1, r7
	mov r8, r1
	movs r1, #0
	mov r2, r8
	strb r0, [r2]
	add r0, sp, #0x24
	movs r4, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x40
	ldr r2, _080AAF94 @ =0x01000008
	bl CpuSet
	adds r5, r7, #0
	adds r5, #0x33
	strb r4, [r5]
	mov r0, sp
	bl LoadAndVerifySoundRoomData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AAF76
	movs r6, #0
	ldr r1, _080AAF98 @ =0x08CE4D28
	ldr r0, [r1]
	mov sb, r8
	mov r8, r5
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	blt _080AAEE8
	movs r4, #0
	movs r0, #8
	adds r0, r0, r1
	mov ip, r0
_080AAE9C:
	mov r2, ip
	ldr r0, [r2]
	cmp r0, #0
	bne _080AAED6
	adds r0, r4, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080AAED6
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080AAED6:
	adds r4, #0x10
	movs r3, #0x10
	add ip, r3
	adds r6, #1
	ldr r1, _080AAF98 @ =0x08CE4D28
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AAE9C
_080AAEE8:
	bl CountSecretSoundRoomSongs
	adds r1, r0, #0
	movs r0, #0x64
	mov r2, r8
	ldrb r2, [r2]
	muls r0, r2, r0
	mov r3, sb
	ldrb r3, [r3]
	subs r1, r3, r1
	bl __divsi3
	mov r1, sl
	strb r0, [r1]
	movs r6, #0
	ldr r1, _080AAF98 @ =0x08CE4D28
	ldr r0, [r1]
	cmp r0, #0
	blt _080AAF76
	movs r5, #0
_080AAF10:
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080AAF68
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _080AAF46
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl _call_via_r2
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x28]
	cmp r0, #0
	beq _080AAF68
_080AAF46:
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	adds r1, r4, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r4, [r0]
_080AAF68:
	adds r5, #0x10
	adds r6, #1
	ldr r1, _080AAF98 @ =0x08CE4D28
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080AAF10
_080AAF76:
	adds r0, r7, #0
	bl CountDisplayedSoundRoomSongs
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AAF94: .4byte 0x01000008
_080AAF98: .4byte 0x08CE4D28

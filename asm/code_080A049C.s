	.include "macro.inc"

	.syntax unified

	thumb_func_start WriteCompletedPlaythroughSaveData
WriteCompletedPlaythroughSaveData: @ 0x080A049C
	push {r4, r5, r6, r7, lr}
	sub sp, #0x64
	bl sub_080A0458
	adds r5, r0, #0
	ldr r7, _080A04E8 @ =0x0202BBF8
	ldrb r0, [r7, #0x14]
	lsrs r4, r0, #6
	movs r0, #1
	ands r4, r0
	adds r6, r4, #0
	mov r0, sp
	bl ReadGlobalSaveInfo
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A04C8
	bl InitGlobalSaveInfo
	mov r0, sp
	bl ReadGlobalSaveInfo
_080A04C8:
	ldrb r1, [r7, #0x18]
	mov r0, sp
	bl RegisterCompletedPlaythrough
	mov r1, sp
	movs r0, #1
	ldrb r2, [r1, #0xe]
	orrs r2, r0
	strb r2, [r1, #0xe]
	cmp r5, #1
	beq _080A050A
	cmp r5, #1
	bgt _080A04EC
	cmp r5, #0
	beq _080A04FA
	b _080A0522
	.align 2, 0
_080A04E8: .4byte 0x0202BBF8
_080A04EC:
	cmp r5, #3
	bgt _080A0522
	cmp r4, #0
	beq _080A051A
	mov r1, sp
	movs r0, #0x80
	b _080A051E
_080A04FA:
	cmp r4, #0
	beq _080A0504
	mov r1, sp
	movs r0, #0x20
	b _080A051E
_080A0504:
	mov r1, sp
	movs r0, #4
	b _080A051E
_080A050A:
	cmp r6, #0
	beq _080A0514
	mov r1, sp
	movs r0, #0x40
	b _080A051E
_080A0514:
	mov r1, sp
	movs r0, #8
	b _080A051E
_080A051A:
	mov r1, sp
	movs r0, #0x10
_080A051E:
	orrs r2, r0
	strb r2, [r1, #0xe]
_080A0522:
	mov r0, sp
	bl WriteGlobalSaveInfo
	cmp r5, #0
	blt _080A0546
	cmp r5, #1
	bgt _080A053A
	movs r0, #0
	movs r1, #0x70
	bl UnlockSoundRoomSong
	b _080A0546
_080A053A:
	cmp r5, #3
	bgt _080A0546
	movs r0, #0
	movs r1, #0x71
	bl UnlockSoundRoomSong
_080A0546:
	add sp, #0x64
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

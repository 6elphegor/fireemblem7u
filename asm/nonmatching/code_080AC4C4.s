	.include "macro.inc"

	.syntax unified

	thumb_func_start DrawSoundRoomVolumeGraphSprites
DrawSoundRoomVolumeGraphSprites: @ 0x080AC4C4
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	mov r8, r1
	adds r4, r2, #0
	movs r6, #0
	movs r7, #0xd
	cmp r3, #0
	beq _080AC532
	movs r0, #0xff
	ands r1, r0
	mov r8, r1
	cmp r4, #7
	ble _080AC514
	mov r5, sb
_080AC4E8:
	subs r4, #8
	ldr r1, _080AC540 @ =0x000001FF
	ands r1, r5
	lsls r0, r7, #0xc
	ldr r2, _080AC544 @ =0x00000847
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	ldr r3, _080AC548 @ =0x08B905B0
	bl PutSpriteExt
	adds r5, #8
	adds r6, #1
	cmp r6, #2
	ble _080AC50A
	movs r7, #0xe
_080AC50A:
	cmp r6, #4
	ble _080AC510
	movs r7, #0xf
_080AC510:
	cmp r4, #7
	bgt _080AC4E8
_080AC514:
	lsls r1, r6, #3
	add r1, sb
	ldr r0, _080AC540 @ =0x000001FF
	ands r1, r0
	ldr r3, _080AC548 @ =0x08B905B0
	lsls r0, r7, #0xc
	adds r0, r4, r0
	movs r2, #0x84
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	mov r2, r8
	bl PutSpriteExt
_080AC532:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AC540: .4byte 0x000001FF
_080AC544: .4byte 0x00000847
_080AC548: .4byte 0x08B905B0

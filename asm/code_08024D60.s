	.include "macro.inc"

	.syntax unified

	thumb_func_start StartUiSMS
StartUiSMS: @ 0x08024D60
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r1, _08024D9C @ =0x08B93E48
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r5, _08024DA0 @ =0x08C99700
	movs r4, #0x7f
	ands r4, r7
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08024DA4 @ =0x08B93E44
	ldr r1, [r1]
	bl Decompress
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _08024DB8
	cmp r0, #1
	bgt _08024DA8
	cmp r0, #0
	beq _08024DAE
	b _08024DD6
	.align 2, 0
_08024D9C: .4byte 0x08B93E48
_08024DA0: .4byte 0x08C99700
_08024DA4: .4byte 0x08B93E44
_08024DA8:
	cmp r0, #2
	beq _08024DC2
	b _08024DD6
_08024DAE:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage16x16
	b _08024DCA
_08024DB8:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage16x32
	b _08024DCA
_08024DC2:
	adds r0, r6, #0
	adds r1, r7, #0
	bl ApplyUnitSpriteImage32x32
_08024DCA:
	ldr r2, _08024DE8 @ =0x02033E44
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_08024DD6:
	ldr r0, _08024DE8 @ =0x02033E44
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08024DE8: .4byte 0x02033E44

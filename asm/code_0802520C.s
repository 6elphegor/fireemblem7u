	.include "macro.inc"

	.syntax unified

	thumb_func_start TornOutUnitSprite
TornOutUnitSprite: @ 0x0802520C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r1, [sp]
	bl GetUnitSMSId
	str r0, [sp, #4]
	bl UseUnitSprite
	lsls r6, r0, #5
	ldr r1, _08025274 @ =0x08B93F18
	ldr r2, [sp]
	lsls r0, r2, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	movs r4, #0
	bl GetGameTime
	movs r1, #0x48
	bl __umodsi3
	adds r1, r0, #0
	cmp r1, #0x43
	ble _08025244
	movs r4, #1
_08025244:
	cmp r1, #0x23
	ble _0802524A
	movs r4, #2
_0802524A:
	cmp r1, #0x1f
	ble _08025250
	movs r4, #1
_08025250:
	cmp r1, #0
	blt _08025256
	movs r4, #0
_08025256:
	ldr r1, _08025278 @ =0x08C99700
	movs r0, #0x7f
	ldr r3, [sp, #4]
	ands r0, r3
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08025304
	cmp r0, #1
	bgt _0802527C
	cmp r0, #0
	beq _08025284
	b _080254DE
	.align 2, 0
_08025274: .4byte 0x08B93F18
_08025278: .4byte 0x08C99700
_0802527C:
	cmp r0, #2
	bne _08025282
	b _080253FC
_08025282:
	b _080254DE
_08025284:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r7, _080252F8 @ =0x02033F14
	mov sb, r7
	lsrs r7, r5, #1
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r4, #0xf
	lsls r4, r0
_0802529A:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r0, r6, r7
	adds r0, r0, r3
	mov r1, sb
	adds r2, r0, r1
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r7, r1
	adds r0, r6, r0
	adds r0, r0, r3
	mov r3, sb
	adds r1, r0, r3
_080252B8:
	adds r0, r4, #0
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r0, r4, #0
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r2, #0x20
	adds r1, #0x20
	adds r5, #1
	cmp r5, #1
	ble _080252B8
	mov r1, r8
	cmp r1, #2
	ble _0802529A
	ldr r7, _080252F8 @ =0x02033F14
	adds r0, r6, r7
	add r0, sl
	ldr r2, _080252FC @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r7, r3
	add r0, sl
	adds r0, r0, r6
	ldr r7, _08025300 @ =0x06011400
	adds r1, r6, r7
	b _080253E0
	.align 2, 0
_080252F8: .4byte 0x02033F14
_080252FC: .4byte 0x06011000
_08025300: .4byte 0x06011400
_08025304:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r2, _080253E8 @ =0x02033F14
	mov sb, r2
	lsrs r3, r5, #1
	str r3, [sp, #8]
	bics r0, r5
	lsls r0, r0, #2
	movs r7, #0xf
	mov ip, r7
	mov r2, ip
	lsls r2, r0
	mov ip, r2
_08025320:
	movs r5, #0
	lsls r3, r1, #0xd
	adds r1, #1
	mov r8, r1
	adds r4, r3, #0
	ldr r3, [sp, #8]
	adds r0, r6, r3
	adds r0, r0, r4
	mov r7, sb
	adds r3, r0, r7
_08025334:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r1, [r3]
	ands r0, r1
	strb r0, [r3]
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r2, r7
	adds r0, r6, r0
	ldr r1, [sp, #8]
	adds r0, r0, r1
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #1
	ble _08025334
	mov r1, r8
	cmp r1, #2
	ble _08025320
	ldr r1, _080253E8 @ =0x02033F14
	adds r0, r6, r1
	add r0, sl
	ldr r2, _080253EC @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F0 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F4 @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x10
	bl CpuFastSet
	ldr r3, _080253E8 @ =0x02033F14
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _080253F8 @ =0x06011C00
	adds r1, r6, r2
_080253E0:
	movs r2, #0x10
	bl CpuFastSet
	b _080254DE
	.align 2, 0
_080253E8: .4byte 0x02033F14
_080253EC: .4byte 0x06011000
_080253F0: .4byte 0x06011400
_080253F4: .4byte 0x06011800
_080253F8: .4byte 0x06011C00
_080253FC:
	movs r1, #0
	lsls r4, r4, #0xd
	mov sl, r4
	ldr r3, _08025500 @ =0x02033F14
	mov sb, r3
	lsrs r7, r5, #1
	str r7, [sp, #8]
	movs r0, #1
	bics r0, r5
	lsls r0, r0, #2
	movs r2, #0xf
	mov ip, r2
	mov r3, ip
	lsls r3, r0
	mov ip, r3
_0802541A:
	movs r5, #0
	adds r7, r1, #1
	mov r8, r7
	lsls r4, r1, #0xd
	ldr r1, [sp, #8]
	adds r0, r6, r1
	adds r0, r0, r4
	mov r2, sb
	adds r3, r0, r2
_0802542C:
	lsls r2, r5, #5
	mov r0, ip
	ldrb r7, [r3]
	ands r0, r7
	strb r0, [r3]
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r2, r1
	adds r0, r6, r0
	ldr r7, [sp, #8]
	adds r0, r0, r7
	adds r0, r0, r4
	add r0, sb
	mov r1, ip
	ldrb r7, [r0]
	ands r1, r7
	strb r1, [r0]
	movs r0, #0xc0
	lsls r0, r0, #4
	adds r2, r2, r0
	adds r2, r6, r2
	ldr r1, [sp, #8]
	adds r2, r2, r1
	adds r2, r2, r4
	add r2, sb
	mov r0, ip
	ldrb r7, [r2]
	ands r0, r7
	strb r0, [r2]
	adds r3, #0x20
	adds r5, #1
	cmp r5, #3
	ble _0802542C
	mov r1, r8
	cmp r1, #2
	ble _0802541A
	ldr r1, _08025500 @ =0x02033F14
	adds r0, r6, r1
	add r0, sl
	ldr r2, _08025504 @ =0x06011000
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #3
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025508 @ =0x06011400
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0x80
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _0802550C @ =0x06011800
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
	ldr r3, _08025500 @ =0x02033F14
	movs r7, #0xc0
	lsls r7, r7, #4
	adds r0, r3, r7
	add r0, sl
	adds r0, r0, r6
	ldr r2, _08025510 @ =0x06011C00
	adds r1, r6, r2
	movs r2, #0x20
	bl CpuFastSet
_080254DE:
	ldr r3, [sp]
	cmp r3, #0x3f
	bne _080254EE
	ldr r0, _08025514 @ =0x02033E44
	ldr r7, [sp, #4]
	adds r0, r7, r0
	movs r1, #0xff
	strb r1, [r0]
_080254EE:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08025500: .4byte 0x02033F14
_08025504: .4byte 0x06011000
_08025508: .4byte 0x06011400
_0802550C: .4byte 0x06011800
_08025510: .4byte 0x06011C00
_08025514: .4byte 0x02033E44

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08040444
sub_08040444: @ 0x08040444
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	ldr r1, _080404CC @ =0x081D5352
	mov r0, sp
	movs r2, #3
	bl memcpy
	bl InitUnits
	movs r6, #0
	ldr r1, _080404D0 @ =0x0203D90C
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _08040520
	mov sb, r1
_0804046C:
	lsls r4, r6, #6
	adds r4, #1
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	mov r0, sb
	adds r0, #6
	adds r0, r6, r0
	ldrb r0, [r0]
	lsls r2, r6, #2
	adds r2, r2, r6
	lsls r2, r2, #2
	subs r2, r2, r6
	ldr r1, _080404D4 @ =0x0203D9AD
	adds r2, r2, r1
	adds r1, r5, #0
	bl ReadMultiArenaSaveTeam
	movs r7, #0
	adds r2, r6, #1
	mov sl, r2
	lsls r0, r6, #1
	ldr r1, _080404D8 @ =0x0203DCC0
	adds r0, r0, r1
	mov r8, r0
_080404A0:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	movs r2, #0
	strb r2, [r5, #9]
	movs r1, #0
	bl SetUnitStatus
	movs r0, #0
	strb r0, [r5, #0x1b]
	movs r0, #4
	ldr r1, _080404DC @ =0x0203DA0C
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _080404E0
	adds r0, r5, #0
	bl sub_0803DD40
	b _080404E6
	.align 2, 0
_080404CC: .4byte 0x081D5352
_080404D0: .4byte 0x0203D90C
_080404D4: .4byte 0x0203D9AD
_080404D8: .4byte 0x0203DCC0
_080404DC: .4byte 0x0203DA0C
_080404E0:
	adds r0, r5, #0
	bl sub_08048E0C
_080404E6:
	cmp r7, #0
	bne _080404F4
	adds r0, r5, #0
	bl GetUnitMiniPortraitId
	mov r2, r8
	strh r0, [r2]
_080404F4:
	strb r4, [r5, #0xb]
	cmp r6, #0
	beq _0804050C
	movs r0, #1
	ldr r1, _08040558 @ =0x0203DA0C
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _0804050C
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r5, #0xc]
_0804050C:
	adds r4, #1
	adds r7, #1
	cmp r7, #4
	ble _080404A0
	mov r6, sl
	mov r2, sb
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r6, r0
	blt _0804046C
_08040520:
	ldr r0, _0804055C @ =0x0203DC9C
	movs r1, #0
	strb r1, [r0]
	ldr r2, _08040560 @ =0x08B98AEC
	ldr r0, [r2]
	strb r1, [r0, #6]
	ldr r3, [r2]
	ldr r1, _08040564 @ =0x0203D90C
	ldrb r0, [r1, #5]
	add r0, sp
	ldrb r0, [r0]
	strb r0, [r3, #9]
	ldr r2, [r2]
	ldrb r0, [r1, #5]
	adds r0, #2
	strb r0, [r2, #7]
	ldrb r0, [r1, #5]
	adds r0, #2
	adds r1, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08040558: .4byte 0x0203DA0C
_0804055C: .4byte 0x0203DC9C
_08040560: .4byte 0x08B98AEC
_08040564: .4byte 0x0203D90C

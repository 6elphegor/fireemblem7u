	.include "macro.inc"

	.syntax unified

	thumb_func_start CanActiveUnitStillMove
CanActiveUnitStillMove: @ 0x0801865C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _080186EC @ =0x081C3B6C
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _080186F0 @ =0x03004690
	ldr r2, [r0]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _080186F4 @ =0x0203A85C
	ldrb r0, [r0, #0x10]
	subs r0, r1, r0
	mov sl, r0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	mov sb, r0
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r7, #0
	mov r4, sp
_0801869E:
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov r1, sb
	adds r6, r1, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r0, _080186F8 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r1, [r0]
	adds r1, r1, r6
	movs r0, #0x80
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	bne _08018700
	ldr r0, _080186F0 @ =0x03004690
	ldr r0, [r0]
	bl GetUnitMovementCost
	ldr r1, _080186FC @ =0x0202E3E0
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08018700
	cmp r0, sl
	bgt _08018700
	movs r0, #1
	b _0801870A
	.align 2, 0
_080186EC: .4byte 0x081C3B6C
_080186F0: .4byte 0x03004690
_080186F4: .4byte 0x0203A85C
_080186F8: .4byte 0x0202E3DC
_080186FC: .4byte 0x0202E3E0
_08018700:
	adds r4, #2
	adds r7, #1
	cmp r7, #3
	ble _0801869E
	movs r0, #0
_0801870A:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

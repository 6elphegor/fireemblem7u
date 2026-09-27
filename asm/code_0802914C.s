	.include "macro.inc"

	.syntax unified

	thumb_func_start BattleCheckTriangleAttack
BattleCheckTriangleAttack: @ 0x0802914C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080291F8 @ =0x081C3CE4
	mov r0, sp
	movs r2, #8
	bl memcpy
	movs r3, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r6, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r6, r0
	movs r0, #0xc0
	lsls r0, r0, #0xf
	ands r6, r0
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	mov sl, r0
	ldrb r5, [r5, #0x11]
	lsls r5, r5, #0x18
	asrs r5, r5, #0x18
	mov sb, r5
	movs r7, #0xc0
	ldrb r4, [r4, #0xb]
	ands r7, r4
	ldr r0, _080291FC @ =0x0203A3D8
	str r3, [r0, #0x10]
	str r3, [r0, #0x14]
	mov r5, sp
	movs r0, #3
	mov r8, r0
_08029198:
	movs r0, #1
	ldrsb r0, [r5, r0]
	add r0, sb
	ldr r1, _08029200 @ =0x0202E3DC
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, [r0]
	add r1, sl
	adds r0, r0, r1
	ldrb r4, [r0]
	cmp r4, #0
	beq _0802920C
	adds r0, r4, #0
	str r3, [sp, #8]
	bl GetUnit
	adds r2, r0, #0
	movs r0, #0xc0
	ands r4, r0
	ldr r3, [sp, #8]
	cmp r4, r7
	bne _0802920C
	adds r1, r2, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #2
	beq _0802920C
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	ands r0, r6
	cmp r0, #0
	beq _0802920C
	adds r3, #1
	ldr r1, _080291FC @ =0x0203A3D8
	ldr r0, [r1, #0x10]
	cmp r0, #0
	bne _08029204
	str r2, [r1, #0x10]
	b _0802920C
	.align 2, 0
_080291F8: .4byte 0x081C3CE4
_080291FC: .4byte 0x0203A3D8
_08029200: .4byte 0x0202E3DC
_08029204:
	ldr r0, [r1, #0x14]
	cmp r0, #0
	bne _0802920C
	str r2, [r1, #0x14]
_0802920C:
	adds r5, #2
	movs r0, #1
	rsbs r0, r0, #0
	add r8, r0
	mov r0, r8
	cmp r0, #0
	bge _08029198
	movs r0, #0
	cmp r3, #1
	ble _08029222
	movs r0, #1
_08029222:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

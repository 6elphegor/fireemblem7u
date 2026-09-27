	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxRestWINH
NewEfxRestWINH: @ 0x08055CD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp]
	str r1, [sp, #4]
	adds r4, r3, #0
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r1, _08055D6C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r6, _08055D70 @ =0x0201FDB8
	ldr r7, _08055D74 @ =0x0201FEF8
	ldr r0, _08055D78 @ =0x0201FDAC
	mov sl, r0
	cmp r4, #2
	bne _08055D32
	ldr r1, _08055D7C @ =0x0201FB2C
	movs r0, #0
	adds r5, r1, #0
	ldr r3, _08055D80 @ =0x0201FB20
	mov ip, r3
	ldr r3, _08055D84 @ =0x0201FB24
	mov r8, r3
	ldr r3, _08055D88 @ =0x0201FB28
	mov sb, r3
_08055D0C:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D0C
	ldr r1, _08055D8C @ =0x0201FC6C
	movs r0, #0
_08055D1A:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D1A
	movs r0, #0
	mov r1, ip
	str r0, [r1]
	mov r3, r8
	str r5, [r3]
	mov r0, sb
	str r5, [r0]
_08055D32:
	adds r1, r6, #0
	movs r0, #0
_08055D36:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D36
	adds r1, r7, #0
	movs r0, #0
_08055D44:
	strh r2, [r1]
	adds r1, #2
	adds r0, #1
	cmp r0, #0x9f
	bls _08055D44
	movs r0, #0
	mov r1, sl
	str r0, [r1]
	ldr r3, _08055D90 @ =0x0201FDB0
	str r6, [r3]
	ldr r0, _08055D94 @ =0x0201FDB4
	str r6, [r0]
	cmp r4, #1
	beq _08055DB8
	cmp r4, #1
	blo _08055D98
	cmp r4, #2
	beq _08055DD8
	b _08055DE6
	.align 2, 0
_08055D6C: .4byte 0x0201774C
_08055D70: .4byte 0x0201FDB8
_08055D74: .4byte 0x0201FEF8
_08055D78: .4byte 0x0201FDAC
_08055D7C: .4byte 0x0201FB2C
_08055D80: .4byte 0x0201FB20
_08055D84: .4byte 0x0201FB24
_08055D88: .4byte 0x0201FB28
_08055D8C: .4byte 0x0201FC6C
_08055D90: .4byte 0x0201FDB0
_08055D94: .4byte 0x0201FDB4
_08055D98:
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08055DAC
	ldr r0, _08055DA8 @ =sub_08055BE0
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DA8: .4byte sub_08055BE0
_08055DAC:
	ldr r0, _08055DB4 @ =sub_08055C30
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DB4: .4byte sub_08055C30
_08055DB8:
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08055DCC
	ldr r0, _08055DC8 @ =sub_08055C08
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DC8: .4byte sub_08055C08
_08055DCC:
	ldr r0, _08055DD4 @ =sub_08055C6C
	bl SetOnHBlankA
	b _08055DE6
	.align 2, 0
_08055DD4: .4byte sub_08055C6C
_08055DD8:
	bl CheckInEkrDragon
	cmp r0, #0
	bne _08055DE6
	ldr r0, _08055E0C @ =sub_08055C08
	bl SetOnHBlankA
_08055DE6:
	ldr r0, _08055E10 @ =0x08BA1554
	movs r1, #0
	bl Proc_Start
	ldr r1, [sp]
	str r1, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	ldr r3, [sp, #4]
	str r3, [r0, #0x44]
	str r4, [r0, #0x48]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08055E0C: .4byte sub_08055C08
_08055E10: .4byte 0x08BA1554

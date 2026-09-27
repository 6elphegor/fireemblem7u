	.include "macro.inc"

	.syntax unified

	thumb_func_start RefreshUnitsOnBmMap
RefreshUnitsOnBmMap: @ 0x08019868
	push {r4, r5, r6, r7, lr}
	movs r7, #1
_0801986C:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _080198C0
	ldr r0, [r6]
	cmp r0, #0
	beq _080198C0
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _080198C0
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _08019950 @ =0x0202E3DC
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
	ldr r0, _08019954 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _080198C0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	adds r0, r6, #0
	bl GetUnitFogViewRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
_080198C0:
	adds r7, #1
	cmp r7, #0x7f
	ble _0801986C
	ldr r0, _08019954 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	beq _08019998
	movs r7, #0x81
_080198D0:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019986
	ldr r2, [r6]
	cmp r2, #0
	beq _08019986
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019986
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08019910
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_08019910:
	ldr r0, _08019954 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019960
	ldr r0, _08019958 @ =0x0202E3EC
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019960
	ldr r0, _0801995C @ =0x0202E3F0
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r1, [r0]
	adds r1, r1, r3
	movs r0, #1
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r6, #0xc]
	b _08019986
	.align 2, 0
_08019950: .4byte 0x0202E3DC
_08019954: .4byte 0x0202BBF8
_08019958: .4byte 0x0202E3EC
_0801995C: .4byte 0x0202E3F0
_08019960:
	ldr r0, _08019990 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
	ldr r1, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019986
	ldr r0, _08019994 @ =0xFFFFFDFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	str r1, [r6, #0xc]
_08019986:
	adds r7, #1
	cmp r7, #0xc5
	ble _080198D0
	b _08019A2C
	.align 2, 0
_08019990: .4byte 0x0202E3DC
_08019994: .4byte 0xFFFFFDFF
_08019998:
	movs r7, #0x81
_0801999A:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019A26
	ldr r2, [r6]
	cmp r2, #0
	beq _08019A26
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019A26
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _080199DA
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_080199DA:
	ldr r0, _08019A08 @ =0x0202BBF8
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019A18
	ldr r0, _08019A0C @ =0x0202E3EC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019A10
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	b _08019A16
	.align 2, 0
_08019A08: .4byte 0x0202BBF8
_08019A0C: .4byte 0x0202E3EC
_08019A10:
	ldr r0, [r6, #0xc]
	ldr r1, _08019A34 @ =0xFFFFFDFF
	ands r0, r1
_08019A16:
	str r0, [r6, #0xc]
_08019A18:
	ldr r0, _08019A38 @ =0x0202E3DC
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
_08019A26:
	adds r7, #1
	cmp r7, #0xc5
	ble _0801999A
_08019A2C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019A34: .4byte 0xFFFFFDFF
_08019A38: .4byte 0x0202E3DC

	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearActiveFactionGrayedStates
ClearActiveFactionGrayedStates: @ 0x08018268
	push {r4, r5, r6, lr}
	ldr r0, _080182F0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _080182B2
	movs r4, #1
	ldr r5, _080182F4 @ =0x08B92EB0
_08018276:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _080182AC
	ldr r3, [r2]
	cmp r3, #0
	beq _080182AC
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _080182AC
	ldr r0, [r2, #0xc]
	ldr r1, _080182F8 @ =0x0001000E
	ands r0, r1
	cmp r0, #0
	bne _080182AC
	ldrb r0, [r3, #4]
	bl PidStatsSubFavval08
_080182AC:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018276
_080182B2:
	ldr r1, _080182F0 @ =0x0202BBF8
	ldrb r0, [r1, #0xf]
	adds r2, r0, #1
	adds r0, #0x40
	cmp r2, r0
	bge _080182EA
	ldr r6, _080182F4 @ =0x08B92EB0
	movs r5, #0xff
	ldr r4, _080182FC @ =0xFFFFFBBD
	adds r3, r1, #0
_080182C6:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _080182E0
	ldr r0, [r1]
	cmp r0, #0
	beq _080182E0
	ldr r0, [r1, #0xc]
	ands r0, r4
	str r0, [r1, #0xc]
_080182E0:
	adds r2, #1
	ldrb r0, [r3, #0xf]
	adds r0, #0x40
	cmp r2, r0
	blt _080182C6
_080182EA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080182F0: .4byte 0x0202BBF8
_080182F4: .4byte 0x08B92EB0
_080182F8: .4byte 0x0001000E
_080182FC: .4byte 0xFFFFFBBD

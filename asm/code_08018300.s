	.include "macro.inc"

	.syntax unified

	thumb_func_start TickActiveFactionTurn
TickActiveFactionTurn: @ 0x08018300
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	movs r0, #0
	mov r8, r0
	movs r1, #0
	bl BeginTargetList
	ldr r0, _08018318 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	adds r5, r0, #1
	b _080183BC
	.align 2, 0
_08018318: .4byte 0x0202BBF8
_0801831C:
	ldr r1, _080183E8 @ =0x08B92EB0
	movs r0, #0xff
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	cmp r2, #0
	beq _080183B6
	ldr r0, [r2]
	cmp r0, #0
	beq _080183B6
	ldr r0, [r2, #0xc]
	ldr r1, _080183EC @ =0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _080183B6
	adds r3, r2, #0
	adds r3, #0x31
	ldrb r2, [r3]
	movs r6, #0xf0
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _0801835C
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_0801835C:
	ldrb r2, [r3]
	movs r1, #0xf
	movs r7, #0xf
	mov ip, r7
	mov r0, ip
	ands r0, r2
	cmp r0, #0
	beq _08018382
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	ands r0, r1
	subs r7, #0x1f
	adds r1, r7, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	movs r0, #1
	mov r8, r0
_08018382:
	adds r3, r4, #0
	adds r3, #0x30
	ldrb r2, [r3]
	adds r0, r6, #0
	ands r0, r2
	cmp r0, #0
	beq _080183B6
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	mov r0, ip
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ands r0, r6
	cmp r0, #0
	bne _080183B6
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl EnlistTarget
_080183B6:
	adds r5, #1
	ldr r0, _080183F0 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
_080183BC:
	adds r0, #0x40
	cmp r5, r0
	blt _0801831C
	mov r7, r8
	cmp r7, #0
	beq _080183DE
	bl RenderMapForFade
	bl RefreshEntityMaps
	bl RenderMap
	movs r0, #1
	bl StartMapFade
	bl RefreshUnitSprites
_080183DE:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080183E8: .4byte 0x08B92EB0
_080183EC: .4byte 0x0001002C
_080183F0: .4byte 0x0202BBF8

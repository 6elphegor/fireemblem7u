	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B839C
sub_080B839C: @ 0x080B839C
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r0, #0
	str r0, [r4, #0x3c]
	str r0, [r4, #0x38]
_080B83A6:
	ldr r5, [r4, #0x30]
	ldrb r0, [r5]
	cmp r0, #0
	bne _080B83B8
	adds r0, r4, #0
	movs r1, #0x64
	bl Proc_Goto
	b _080B84CA
_080B83B8:
	ldrb r0, [r5, #1]
	lsls r1, r0, #0x18
	lsrs r2, r1, #0x18
	mov ip, r2
	lsrs r1, r1, #0x1d
	lsls r1, r1, #2
	adds r1, r1, r4
	movs r7, #0x1f
	adds r2, r7, #0
	ands r2, r0
	ldr r3, [r1, #0x40]
	lsrs r3, r2
	movs r6, #1
	ands r3, r6
	cmp r3, #0
	bne _080B84C2
	ldrb r2, [r5, #2]
	lsls r0, r2, #0x18
	cmp r0, #0
	beq _080B83F4
	lsrs r0, r0, #0x1d
	lsls r0, r0, #2
	adds r0, r0, r4
	adds r1, r7, #0
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	ands r0, r6
	cmp r0, #0
	bne _080B84C2
_080B83F4:
	mov r0, ip
	cmp r0, #0xcd
	bne _080B8410
	ldr r1, _080B840C @ =0x0202BBF8
	adds r1, #0x2b
	adds r0, r6, #0
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #0
	beq _080B84C2
	str r3, [r4, #0x38]
	b _080B8488
	.align 2, 0
_080B840C: .4byte 0x0202BBF8
_080B8410:
	ldrb r0, [r5, #1]
	bl GetUnitForCharacterEnding
	adds r1, r0, #0
	str r1, [r4, #0x38]
	cmp r1, #0
	beq _080B84C2
	ldr r2, [r4, #0x30]
	ldrb r0, [r2]
	cmp r0, #2
	beq _080B8448
	cmp r0, #2
	bgt _080B8430
	cmp r0, #1
	beq _080B843A
	b _080B8488
_080B8430:
	cmp r0, #3
	beq _080B8464
	cmp r0, #4
	beq _080B847C
	b _080B8488
_080B843A:
	ldr r0, [r4, #0x34]
	bl sub_080B8358
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B84C2
	b _080B8488
_080B8448:
	ldrb r0, [r2, #2]
	bl GetUnitForCharacterEnding
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B84C2
	ldr r0, [r4, #0x38]
	bl GetUnitASupporterPid
	ldr r1, [r4, #0x30]
	ldrb r1, [r1, #2]
	cmp r0, r1
	bne _080B84C2
	b _080B8488
_080B8464:
	movs r0, #1
	bl GetUnitFromCharId
	bl GetUnitASupporterPid
	cmp r0, #0x25
	beq _080B84C2
	ldr r0, [r4, #0x30]
	ldrb r0, [r0, #2]
	bl GetUnitForCharacterEnding
	b _080B8482
_080B847C:
	movs r0, #0xf
	bl GetUnitFromCharId
_080B8482:
	str r0, [r4, #0x3c]
	cmp r0, #0
	beq _080B84C2
_080B8488:
	ldr r3, [r4, #0x30]
	ldrb r1, [r3, #1]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	adds r2, r2, r4
	movs r6, #0x1f
	adds r0, r6, #0
	ands r0, r1
	movs r5, #1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r1, [r3, #2]
	lsls r2, r1, #0x18
	cmp r2, #0
	beq _080B84CA
	lsrs r2, r2, #0x1d
	lsls r2, r2, #2
	adds r2, r2, r4
	adds r0, r6, #0
	ands r0, r1
	adds r1, r5, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	b _080B84CA
_080B84C2:
	ldr r0, [r4, #0x30]
	adds r0, #8
	str r0, [r4, #0x30]
	b _080B83A6
_080B84CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

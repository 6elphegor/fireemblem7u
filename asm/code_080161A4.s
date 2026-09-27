	.include "macro.inc"

	.syntax unified

	thumb_func_start CanUnitUseWeapon
CanUnitUseWeapon: @ 0x080161A4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	cmp r5, #0
	bne _080161B0
	b _08016346
_080161B0:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08016300 @ =0x08BE222C
	adds r0, r0, r1
	ldr r2, [r0, #8]
	movs r0, #1
	ands r0, r2
	adds r3, r1, #0
	cmp r0, #0
	bne _080161CC
	b _08016346
_080161CC:
	ldr r0, _08016304 @ =0x003D3C00
	ands r0, r2
	cmp r0, #0
	bne _080161D6
	b _08016320
_080161D6:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r2, r0
	cmp r2, #0
	beq _080161F6
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080161F6
	b _08016346
_080161F6:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08016224
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x15
	ands r0, r1
	cmp r0, #0
	bne _08016224
	b _08016346
_08016224:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _08016250
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x16
	ands r0, r1
	cmp r0, #0
	beq _08016346
_08016250:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xd
	ands r0, r1
	cmp r0, #0
	beq _0801627C
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x17
	ands r0, r1
	cmp r0, #0
	beq _08016346
_0801627C:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080162A2
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	cmp r0, #0
	bge _08016346
_080162A2:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #5
	ands r0, r1
	cmp r0, #0
	beq _080162CE
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xa
	ands r0, r1
	cmp r0, #0
	beq _08016346
_080162CE:
	movs r0, #0xff
	ands r0, r5
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r1, r1, r3
	ldr r1, [r1, #8]
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08016308
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xb
	ands r0, r1
	cmp r0, #0
	beq _08016346
	movs r0, #1
	b _08016378
	.align 2, 0
_08016300: .4byte 0x08BE222C
_08016304: .4byte 0x003D3C00
_08016308:
	movs r0, #0x80
	lsls r0, r0, #9
	ands r1, r0
	cmp r1, #0
	beq _08016320
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_08017178
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08016346
_08016320:
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	ldr r3, _0801634C @ =0x08BE222C
	cmp r0, #3
	bne _08016350
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldr r0, [r0, #8]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08016350
_08016346:
	movs r0, #0
	b _08016378
	.align 2, 0
_0801634C: .4byte 0x08BE222C
_08016350:
	movs r1, #0xff
	ands r1, r5
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r2, [r0, #0x1c]
	movs r1, #0xff
	cmp r5, #0
	beq _08016366
	ldrb r1, [r0, #7]
_08016366:
	adds r0, r4, #0
	adds r0, #0x28
	adds r0, r0, r1
	movs r1, #0
	ldrb r0, [r0]
	cmp r0, r2
	blt _08016376
	movs r1, #1
_08016376:
	adds r0, r1, #0
_08016378:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

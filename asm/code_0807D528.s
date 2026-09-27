	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D528
sub_0807D528: @ 0x0807D528
	push {r4, lr}
	movs r0, #9
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r4, r1, #0x1f
	movs r0, #0xa
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D548
	adds r4, #1
_0807D548:
	movs r0, #0xb
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D556
	adds r4, #1
_0807D556:
	movs r0, #0xc
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D564
	adds r4, #1
_0807D564:
	movs r0, #0xd
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D572
	adds r4, #1
_0807D572:
	movs r0, #0xe
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D580
	adds r4, #1
_0807D580:
	movs r0, #0xf
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D58E
	adds r4, #1
_0807D58E:
	movs r0, #0x10
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D59C
	adds r4, #1
_0807D59C:
	movs r0, #0x11
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0807D5AA
	adds r4, #1
_0807D5AA:
	cmp r4, #3
	ble _0807D5B2
	movs r0, #0
	b _0807D5B4
_0807D5B2:
	movs r0, #1
_0807D5B4:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047068
sub_08047068: @ 0x08047068
	push {r4, r5, lr}
	ldr r0, _080470B0 @ =0x0203A3F0
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _080470B4 @ =0x0203A470
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _08047098
	ldr r0, [r4, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r4, #0xc]
_08047098:
	adds r0, r5, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080470AA
	ldr r0, [r5, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_080470AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080470B0: .4byte 0x0203A3F0
_080470B4: .4byte 0x0203A470

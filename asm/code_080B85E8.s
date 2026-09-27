	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B85E8
sub_080B85E8: @ 0x080B85E8
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	movs r6, #0
_080B85EE:
	lsls r1, r6, #2
	adds r0, r5, #0
	adds r0, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080B8642
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl GetPidStats
	adds r1, r0, #0
	lsls r2, r6, #1
	adds r0, r5, #0
	adds r0, #0x3c
	adds r4, r0, r2
	ldrh r3, [r1, #0xc]
	lsls r0, r3, #0x12
	lsrs r0, r0, #0x14
	ldr r3, _080B8650 @ =0x000003E7
	cmp r0, r3
	ble _080B861C
	adds r0, r3, #0
_080B861C:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x40
	adds r4, r0, r2
	movs r0, #3
	ldrb r7, [r1, #0xc]
	ands r0, r7
	lsls r0, r0, #8
	ldrb r7, [r1, #0xb]
	orrs r0, r7
	cmp r0, r3
	ble _080B8636
	adds r0, r3, #0
_080B8636:
	strh r0, [r4]
	adds r0, r5, #0
	adds r0, #0x44
	adds r0, r0, r2
	ldrb r1, [r1]
	strh r1, [r0]
_080B8642:
	adds r6, #1
	cmp r6, #1
	ble _080B85EE
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B8650: .4byte 0x000003E7

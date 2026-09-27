	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B67F0
sub_080B67F0: @ 0x080B67F0
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B67F6:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080B682A
	ldr r2, [r0]
	cmp r2, #0
	beq _080B682A
	ldr r0, [r0, #0xc]
	ldr r1, _080B683C @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B682A
	ldrb r0, [r2, #4]
	bl GetPidStats
	ldrb r0, [r0, #5]
	lsls r1, r0, #0x1a
	lsrs r1, r1, #0x1a
	ldr r0, _080B6840 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _080B682A
	adds r5, #1
_080B682A:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B67F6
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B683C: .4byte 0x00010004
_080B6840: .4byte 0x0202BBF8

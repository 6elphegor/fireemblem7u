	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803019C
sub_0803019C: @ 0x0803019C
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldr r0, _080301B8 @ =0x08B96444
	ldr r3, [r0]
	adds r0, r3, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r2, r0
	bne _080301BC
	movs r0, #0
	b _08030204
	.align 2, 0
_080301B8: .4byte 0x08B96444
_080301BC:
	adds r0, r3, #0
	adds r0, #0x2d
	adds r1, r0, r2
	adds r4, r2, #1
	adds r0, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080301DA
	movs r0, #1
	b _08030204
_080301DA:
	cmp r1, r0
	ble _080301E2
	movs r0, #3
	b _08030204
_080301E2:
	adds r0, r3, #0
	adds r0, #0x41
	adds r1, r0, r2
	adds r0, r0, r4
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _080301FE
	movs r0, #2
	b _08030204
_080301FE:
	cmp r1, r0
	ble _08030204
	movs r0, #4
_08030204:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

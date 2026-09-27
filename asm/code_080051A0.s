	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080051A0
sub_080051A0: @ 0x080051A0
	push {r4, r5, r6, r7, lr}
	ldr r0, _080051E8 @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r3, #0
	ldr r7, _080051EC @ =0x02026D30
	movs r0, #0x14
	adds r0, r0, r7
	mov ip, r0
	movs r6, #0xff
_080051B6:
	lsls r1, r3, #6
	ldr r0, _080051E8 @ =0x02023C60
	adds r2, r1, r0
	ldr r0, [r7, #0x10]
	adds r0, r3, r0
	ands r0, r6
	lsls r0, r0, #5
	add r0, ip
	ldrb r0, [r0]
	adds r5, r3, #1
	cmp r0, #0
	beq _08005206
	ldr r4, _080051EC @ =0x02026D30
	ldr r0, [r4, #0x10]
	adds r0, r3, r0
	ands r0, r6
	lsls r0, r0, #5
	adds r1, r4, #0
	adds r1, #0x14
	adds r1, r0, r1
_080051DE:
	ldrb r0, [r1]
	cmp r0, #0x60
	bls _080051F0
	subs r0, #0x40
	b _080051F2
	.align 2, 0
_080051E8: .4byte 0x02023C60
_080051EC: .4byte 0x02026D30
_080051F0:
	subs r0, #0x20
_080051F2:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r4, #6]
	adds r0, r3, r0
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	ldrb r0, [r1]
	cmp r0, #0
	bne _080051DE
_08005206:
	adds r3, r5, #0
	cmp r3, #0x13
	ble _080051B6
	movs r0, #4
	bl EnableBgSync
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

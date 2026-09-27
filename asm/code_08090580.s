	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08090580
sub_08090580: @ 0x08090580
	push {r4, lr}
	adds r3, r0, #0
	ldr r4, _08090594 @ =0x02012466
	ldrh r0, [r4]
	adds r2, r0, #0
	cmp r2, #0
	bne _08090598
	strb r2, [r3]
	strh r2, [r1]
	b _080905CC
	.align 2, 0
_08090594: .4byte 0x02012466
_08090598:
	cmp r2, #7
	bhi _080905AA
	ldrb r4, [r3]
	cmp r4, r2
	blo _080905A6
	subs r0, #1
	strb r0, [r3]
_080905A6:
	movs r0, #0
	b _080905CA
_080905AA:
	ldrh r2, [r1]
	lsrs r0, r2, #4
	adds r2, r0, #7
	ldrh r0, [r4]
	cmp r2, r0
	bge _080905C2
	ldrb r4, [r3]
	cmp r4, #6
	bne _080905CC
	movs r0, #5
	strb r0, [r3]
	b _080905CC
_080905C2:
	cmp r2, r0
	ble _080905CC
	subs r0, #7
	lsls r0, r0, #4
_080905CA:
	strh r0, [r1]
_080905CC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsAddMove
PidStatsAddMove: @ 0x080A003C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A0090
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0090
	lsls r1, r4, #4
	ldr r0, _080A0098 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _080A0090
	ldrb r4, [r3, #7]
	lsrs r1, r4, #6
	ldrb r2, [r3, #8]
	lsls r0, r2, #2
	orrs r0, r1
	adds r2, r0, r5
	movs r0, #0xfa
	lsls r0, r0, #2
	cmp r2, r0
	ble _080A0076
	adds r2, r0, #0
_080A0076:
	movs r0, #3
	ands r0, r2
	lsls r0, r0, #6
	movs r1, #0x3f
	ands r1, r4
	orrs r1, r0
	strb r1, [r3, #7]
	lsrs r0, r2, #2
	strb r0, [r3, #8]
	adds r0, r6, #0
	movs r1, #2
	bl PidStatsAddFavval
_080A0090:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A0098: .4byte 0x0203E790

	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsAddFavval
PidStatsAddFavval: @ 0x080A0248
	push {r4, r5, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A02AA
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A02AA
	lsls r1, r4, #4
	ldr r0, _080A0284 @ =0x0203E790
	adds r3, r1, r0
	cmp r3, #0
	beq _080A02AA
	ldr r2, [r3]
	lsls r0, r2, #8
	lsrs r0, r0, #0x10
	adds r1, r0, r5
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r1, r0
	ble _080A028C
	ldr r0, _080A0288 @ =0xFF0000FF
	ands r0, r2
	movs r1, #0x80
	lsls r1, r1, #0xf
	b _080A02A6
	.align 2, 0
_080A0284: .4byte 0x0203E790
_080A0288: .4byte 0xFF0000FF
_080A028C:
	cmp r1, #0
	bge _080A029C
	ldr r0, _080A0298 @ =0xFF0000FF
	ands r2, r0
	str r2, [r3]
	b _080A02AA
	.align 2, 0
_080A0298: .4byte 0xFF0000FF
_080A029C:
	ldr r0, _080A02B0 @ =0x0000FFFF
	ands r1, r0
	lsls r1, r1, #8
	ldr r0, _080A02B4 @ =0xFF0000FF
	ands r0, r2
_080A02A6:
	orrs r0, r1
	str r0, [r3]
_080A02AA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A02B0: .4byte 0x0000FFFF
_080A02B4: .4byte 0xFF0000FF

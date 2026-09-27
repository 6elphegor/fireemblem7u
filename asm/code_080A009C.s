	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsAddExpGained
PidStatsAddExpGained: @ 0x080A009C
	push {r4, r5, r6, lr}
	adds r5, r1, #0
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r6, r4, #0
	cmp r4, #0x45
	bhi _080A00E8
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A00E8
	lsls r1, r4, #4
	ldr r0, _080A00F0 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _080A00E8
	ldr r3, [r2, #8]
	lsls r0, r3, #8
	lsrs r0, r0, #0x14
	adds r0, r0, r5
	movs r1, #0xfa
	lsls r1, r1, #4
	cmp r0, r1
	ble _080A00D2
	adds r0, r1, #0
_080A00D2:
	ldr r1, _080A00F4 @ =0x00000FFF
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, _080A00F8 @ =0xFF000FFF
	ands r0, r3
	orrs r0, r1
	str r0, [r2, #8]
	adds r0, r6, #0
	adds r1, r5, #0
	bl PidStatsAddFavval
_080A00E8:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A00F0: .4byte 0x0203E790
_080A00F4: .4byte 0x00000FFF
_080A00F8: .4byte 0xFF000FFF

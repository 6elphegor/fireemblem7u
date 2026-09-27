	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsRecordBattleRes
PidStatsRecordBattleRes: @ 0x080A02B8
	push {r4, r5, r6, r7, lr}
	movs r7, #0
	movs r5, #0
	ldr r4, _080A0314 @ =0x0203A3F0
	adds r0, r4, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A02CE
	adds r7, r4, #0
	ldr r5, _080A0318 @ =0x0203A470
_080A02CE:
	ldr r6, _080A0318 @ =0x0203A470
	adds r0, r6, #0
	bl GetUnitCurrentHp
	cmp r0, #0
	bne _080A02DE
	adds r7, r6, #0
	adds r5, r4, #0
_080A02DE:
	cmp r7, #0
	beq _080A030E
	cmp r5, #0
	beq _080A02F8
	movs r0, #0xc0
	ldrb r1, [r5, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A02F8
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_0809FD9C
_080A02F8:
	cmp r7, #0
	beq _080A030E
	movs r0, #0xc0
	ldrb r1, [r7, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _080A030E
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	bl PidStatsRecordLoseData
_080A030E:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0314: .4byte 0x0203A3F0
_080A0318: .4byte 0x0203A470

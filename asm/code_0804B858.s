	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804B858
sub_0804B858: @ 0x0804B858
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r4, #0
	ldr r0, _0804B888 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #2
	ldrh r1, [r1, #4]
	ands r0, r1
	cmp r0, #0
	beq _0804B874
	adds r1, r6, #0
	adds r1, #0x29
	movs r0, #1
	strb r0, [r1]
_0804B874:
	ldr r0, _0804B88C @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _0804B930
	cmp r0, #3
	ble _0804B890
	cmp r0, #4
	beq _0804B93C
	b _0804B93E
	.align 2, 0
_0804B888: .4byte 0x08B857F8
_0804B88C: .4byte 0x0203E02C
_0804B890:
	cmp r0, #0
	blt _0804B93E
	ldr r0, _0804B8D8 @ =0x0201FAF8
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #2
	bne _0804B93E
	bl GetBattleAnimArenaFlag
	cmp r0, #0
	beq _0804B93C
	ldr r5, _0804B8DC @ =0x0203E0D4
	ldr r0, _0804B8E0 @ =0x0203E094
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5]
	ldr r0, _0804B8E4 @ =0x0203E098
	ldr r0, [r0]
	adds r0, #0x6e
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r5, #2]
	ldr r1, _0804B8E8 @ =0x0203E0B8
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804B8EC
	movs r0, #1
	bl ArenaSetResult
	b _0804B93C
	.align 2, 0
_0804B8D8: .4byte 0x0201FAF8
_0804B8DC: .4byte 0x0203E0D4
_0804B8E0: .4byte 0x0203E094
_0804B8E4: .4byte 0x0203E098
_0804B8E8: .4byte 0x0203E0B8
_0804B8EC:
	movs r2, #2
	ldrsh r0, [r1, r2]
	cmp r0, #0
	bne _0804B8FE
	movs r0, #2
_0804B8F6:
	bl ArenaSetResult
	strh r4, [r5, #2]
	b _0804B93C
_0804B8FE:
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804B910
	bl sub_0805555C
	movs r0, #4
	b _0804B8F6
_0804B910:
	bl ArenaContinueBattle
	bl ParseBattleHitToBanimCmd
	bl AnimClearAll
	bl UpdateBanimFrame
	bl InitMainAnims
	strh r4, [r6, #0x2c]
	ldr r0, _0804B92C @ =ekrBattleTriggerNewRoundStart
	str r0, [r6, #0xc]
	b _0804B93E
	.align 2, 0
_0804B92C: .4byte ekrBattleTriggerNewRoundStart
_0804B930:
	ldr r0, _0804B94C @ =0x0201FAF8
	ldr r1, [r0]
	ldr r0, [r0, #4]
	adds r1, r1, r0
	cmp r1, #1
	bne _0804B93E
_0804B93C:
	movs r4, #1
_0804B93E:
	cmp r4, #1
	bne _0804B946
	ldr r0, _0804B950 @ =ekrBattleOnBattleEnd
	str r0, [r6, #0xc]
_0804B946:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804B94C: .4byte 0x0201FAF8
_0804B950: .4byte ekrBattleOnBattleEnd

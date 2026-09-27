	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsAddBattleAmt
PidStatsAddBattleAmt: @ 0x0809FD30
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r0, #0xc0
	ldrb r1, [r4, #0xb]
	ands r0, r1
	cmp r0, #0
	bne _0809FD84
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	adds r5, r0, #0
	cmp r0, #0x45
	bhi _0809FD84
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FD84
	lsls r1, r5, #4
	ldr r0, _0809FD8C @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _0809FD84
	ldrh r3, [r2, #0xc]
	lsls r0, r3, #0x12
	lsrs r1, r0, #0x14
	ldr r0, _0809FD90 @ =0x00000F9F
	cmp r1, r0
	bgt _0809FD7A
	adds r0, r1, #1
	ldr r5, _0809FD94 @ =0x00000FFF
	adds r1, r5, #0
	ands r0, r1
	lsls r0, r0, #2
	ldr r1, _0809FD98 @ =0xFFFFC003
	ands r1, r3
	orrs r1, r0
	strh r1, [r2, #0xc]
_0809FD7A:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #4
	bl PidStatsAddFavval
_0809FD84:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FD8C: .4byte 0x0203E790
_0809FD90: .4byte 0x00000F9F
_0809FD94: .4byte 0x00000FFF
_0809FD98: .4byte 0xFFFFC003

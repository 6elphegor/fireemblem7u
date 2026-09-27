	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsGetExpGain
PidStatsGetExpGain: @ 0x080A01DC
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A01FC
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A01FC
	lsls r1, r4, #4
	ldr r0, _080A0200 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	bne _080A0204
_080A01FC:
	movs r0, #0
	b _080A020A
	.align 2, 0
_080A0200: .4byte 0x0203E790
_080A0204:
	ldr r0, [r1, #8]
	lsls r0, r0, #8
	lsrs r0, r0, #0x14
_080A020A:
	pop {r4}
	pop {r1}
	bx r1

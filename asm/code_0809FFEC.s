	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsAddDeployAmt
PidStatsAddDeployAmt: @ 0x0809FFEC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _080A0030
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0030
	lsls r1, r4, #4
	ldr r0, _080A0038 @ =0x0203E790
	adds r2, r1, r0
	cmp r2, #0
	beq _080A0030
	ldrb r3, [r2, #7]
	lsls r0, r3, #0x1a
	lsrs r0, r0, #0x1a
	cmp r0, #0x3b
	bgt _080A0028
	adds r1, r0, #1
	movs r0, #0x3f
	ands r1, r0
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r2, #7]
_080A0028:
	adds r0, r5, #0
	movs r1, #0x40
	bl PidStatsAddFavval
_080A0030:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080A0038: .4byte 0x0203E790

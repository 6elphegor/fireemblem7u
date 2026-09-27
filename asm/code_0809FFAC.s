	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsAddStatView
PidStatsAddStatView: @ 0x0809FFAC
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r5, r4, #0
	cmp r4, #0x45
	bhi _0809FFE0
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _0809FFE0
	lsls r1, r4, #4
	ldr r0, _0809FFE8 @ =0x0203E790
	adds r1, r1, r0
	cmp r1, #0
	beq _0809FFE0
	ldrb r0, [r1, #4]
	cmp r0, #0xc7
	bhi _0809FFD8
	adds r0, #1
	strb r0, [r1, #4]
_0809FFD8:
	adds r0, r5, #0
	movs r1, #2
	bl PidStatsAddFavval
_0809FFE0:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0809FFE8: .4byte 0x0203E790

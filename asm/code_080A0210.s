	.include "macro.inc"

	.syntax unified

	thumb_func_start PidStatsGetFavval
PidStatsGetFavval: @ 0x080A0210
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r0, #0x45
	bhi _080A0230
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0230
	lsls r1, r4, #4
	ldr r0, _080A0238 @ =0x0203E790
	adds r0, r1, r0
	cmp r0, #0
	bne _080A023C
_080A0230:
	movs r0, #0x80
	lsls r0, r0, #6
	b _080A0242
	.align 2, 0
_080A0238: .4byte 0x0203E790
_080A023C:
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x16
_080A0242:
	pop {r4}
	pop {r1}
	bx r1

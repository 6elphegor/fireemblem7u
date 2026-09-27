	.include "macro.inc"

	.syntax unified

	thumb_func_start GetPidStats
GetPidStats: @ 0x080A0550
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	cmp r4, #0x45
	bhi _080A0574
	adds r0, r4, #0
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A0574
	lsls r0, r4, #4
	ldr r1, _080A0570 @ =0x0203E790
	adds r0, r0, r1
	b _080A0576
	.align 2, 0
_080A0570: .4byte 0x0203E790
_080A0574:
	movs r0, #0
_080A0576:
	pop {r4}
	pop {r1}
	bx r1

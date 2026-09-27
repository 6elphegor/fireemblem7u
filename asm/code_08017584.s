	.include "macro.inc"

	.syntax unified

	thumb_func_start GetFreeBlueUnit
GetFreeBlueUnit: @ 0x08017584
	push {r4, r5, lr}
	movs r5, #0x40
	ldrb r4, [r0]
	bl GetPlayerLeaderUnitId
	movs r2, #1
	ldr r4, _080175A8 @ =0x08B92EB0
	movs r3, #0xff
_08017594:
	adds r0, r2, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _080175AC
	adds r0, r1, #0
	b _080175B4
	.align 2, 0
_080175A8: .4byte 0x08B92EB0
_080175AC:
	adds r2, #1
	cmp r2, r5
	blt _08017594
	movs r0, #0
_080175B4:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameDeathCount
GetGameDeathCount: @ 0x080B6798
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080B679E:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080B67BC
	ldr r0, [r1]
	cmp r0, #0
	beq _080B67BC
	ldr r0, [r1, #0xc]
	ldr r1, _080B67CC @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080B67BC
	adds r5, #1
_080B67BC:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B679E
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080B67CC: .4byte 0x00010004

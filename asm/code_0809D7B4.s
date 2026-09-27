	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D7B4
sub_0809D7B4: @ 0x0809D7B4
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	ldr r0, _0809D7F0 @ =0x020143FC
	str r4, [r0]
	ldr r1, _0809D7F4 @ =0x02014400
	movs r0, #1
	lsls r0, r4
	subs r0, #1
	str r0, [r1]
	ldr r6, _0809D7F8 @ =0x02014404
	movs r0, #0x1e
	adds r1, r4, #0
	bl __divsi3
	adds r5, r0, #0
	str r5, [r6]
	movs r0, #0x1e
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809D7E6
	adds r0, r5, #1
	str r0, [r6]
_0809D7E6:
	ldr r0, _0809D7FC @ =0x02014408
	str r7, [r0]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809D7F0: .4byte 0x020143FC
_0809D7F4: .4byte 0x02014400
_0809D7F8: .4byte 0x02014404
_0809D7FC: .4byte 0x02014408

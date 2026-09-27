	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D800
sub_0809D800: @ 0x0809D800
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _0809D828 @ =0x020143FC
	ldr r4, [r0]
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	adds r6, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl __modsi3
	cmp r0, #0
	ble _0809D820
	adds r6, #1
_0809D820:
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0809D828: .4byte 0x020143FC

	.include "macro.inc"

	.syntax unified

	thumb_func_start AddTrap
AddTrap: @ 0x0802BACC
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0802BAD8 @ =0x0203A518
	b _0802BADE
	.align 2, 0
_0802BAD8: .4byte 0x0203A518
_0802BADC:
	adds r1, #8
_0802BADE:
	ldrb r0, [r1, #2]
	cmp r0, #0
	bne _0802BADC
	strb r4, [r1]
	strb r5, [r1, #1]
	strb r2, [r1, #2]
	strb r3, [r1, #3]
	adds r0, r1, #0
	pop {r4, r5}
	pop {r1}
	bx r1

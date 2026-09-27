	.include "macro.inc"

	.syntax unified

	thumb_func_start CpOrderMain
CpOrderMain: @ 0x080349BC
	push {r4, lr}
	ldr r4, _080349DC @ =0x08B96F0C
	ldr r2, _080349E0 @ =0x0203A8EC
	adds r2, #0x78
	ldrb r1, [r2]
	adds r3, r1, #1
	strb r3, [r2]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x16
	adds r1, r1, r4
	ldr r1, [r1]
	bl _call_via_r1
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080349DC: .4byte 0x08B96F0C
_080349E0: .4byte 0x0203A8EC

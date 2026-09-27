	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadPidStats
ReadPidStats: @ 0x0809FAA4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809FAC4 @ =0x03005E70
	ldr r1, _0809FAC8 @ =0x0203E7A0
	movs r2, #0x8c
	lsls r2, r2, #3
	ldr r3, [r0]
	adds r0, r4, #0
	bl _call_via_r3
	ldr r0, _0809FACC @ =0x0203E79C
	str r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809FAC4: .4byte 0x03005E70
_0809FAC8: .4byte 0x0203E7A0
_0809FACC: .4byte 0x0203E79C

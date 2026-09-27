	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadChapterStats
ReadChapterStats: @ 0x0809FAD0
	push {lr}
	ldr r2, _0809FAE4 @ =0x03005E70
	ldr r1, _0809FAE8 @ =0x0203EC00
	ldr r3, [r2]
	movs r2, #0xc0
	bl _call_via_r3
	pop {r0}
	bx r0
	.align 2, 0
_0809FAE4: .4byte 0x03005E70
_0809FAE8: .4byte 0x0203EC00

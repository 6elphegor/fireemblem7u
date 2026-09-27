	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadGameSavePlaySt
ReadGameSavePlaySt: @ 0x080A09B4
	push {r4, lr}
	adds r4, r1, #0
	bl GetSaveReadAddr
	ldr r1, _080A09D0 @ =0x03005E70
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x48
	bl _call_via_r3
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080A09D0: .4byte 0x03005E70

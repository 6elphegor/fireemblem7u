	.include "macro.inc"

	.syntax unified

	thumb_func_start DebugMenu_GNightEffect
DebugMenu_GNightEffect: @ 0x0801BDCC
	push {lr}
	movs r0, #0xc0
	lsls r0, r0, #2
	bl sub_08002D48
	movs r0, #0x17
	pop {r1}
	bx r1

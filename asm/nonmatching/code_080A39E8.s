	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenu_080A465C
SaveMenu_080A465C: @ 0x080A39E8
	push {lr}
	adds r1, r0, #0
	adds r1, #0x2e
	ldrb r1, [r1]
	bl Proc_Goto
	pop {r0}
	bx r0

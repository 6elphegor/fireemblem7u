	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveMenuRegisterSlotSelected
SaveMenuRegisterSlotSelected: @ 0x080A40F8
	adds r3, r0, #0
	adds r3, #0x2e
	movs r2, #0
	movs r1, #6
	strb r1, [r3]
	adds r0, #0x29
	strb r2, [r0]
	bx lr

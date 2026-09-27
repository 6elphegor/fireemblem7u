	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrUnitMainMiniMain
EkrUnitMainMiniMain: @ 0x08054F14
	push {r4, lr}
	ldr r4, [r0, #0x5c]
	ldr r1, [r4, #0x14]
	adds r0, r4, #0
	bl sub_080548CC
	ldr r1, [r4, #0x18]
	adds r0, r4, #0
	bl sub_080548CC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

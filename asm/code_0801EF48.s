	.include "macro.inc"

	.syntax unified

	thumb_func_start StartArrowTrapAnim
StartArrowTrapAnim: @ 0x0801EF48
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _0801EF60 @ =0x08B93874
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0801EF60: .4byte 0x08B93874

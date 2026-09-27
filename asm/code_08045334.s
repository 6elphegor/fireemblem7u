	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045334
sub_08045334: @ 0x08045334
	push {lr}
	ldr r0, _08045350 @ =0x08B961A8
	bl Proc_EndEach
	bl EndLinkArenaFogPlaceholders
	bl BMapVSync_End
	movs r0, #1
	bl FadeBgmOut
	pop {r0}
	bx r0
	.align 2, 0
_08045350: .4byte 0x08B961A8

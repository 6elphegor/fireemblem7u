	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B98C
sub_0806B98C: @ 0x0806B98C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B1D8
	bl EndEkrGauge
	ldr r0, _0806B9B0 @ =OnMain
	bl SetMainFunc
	ldr r0, _0806B9B4 @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B9B0: .4byte OnMain
_0806B9B4: .4byte OnVBlank

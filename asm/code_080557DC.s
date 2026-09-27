	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080557DC
sub_080557DC: @ 0x080557DC
	push {r4, lr}
	adds r4, r0, #0
	bl sub_0804B1D8
	bl EndEkrGauge
	ldr r0, _08055800 @ =OnMain
	bl SetMainFunc
	ldr r0, _08055804 @ =OnVBlank
	bl SetOnVBlank
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08055800: .4byte OnMain
_08055804: .4byte OnVBlank

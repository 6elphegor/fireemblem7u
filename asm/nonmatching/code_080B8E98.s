	.include "macro.inc"

	.syntax unified

	thumb_func_start EndEndingBattleText
EndEndingBattleText: @ 0x080B8E98
	push {lr}
	ldr r0, _080B8EA4 @ =0x08CEE988
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080B8EA4: .4byte 0x08CEE988

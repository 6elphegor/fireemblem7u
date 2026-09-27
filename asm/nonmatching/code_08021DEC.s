	.include "macro.inc"

	.syntax unified

	thumb_func_start AttackMapSelect_End
AttackMapSelect_End: @ 0x08021DEC
	push {lr}
	ldr r0, _08021E0C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	bl HideMoveRangeGraphics
	bl CloseBattleForecast
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_08021E0C: .4byte 0x02023C60

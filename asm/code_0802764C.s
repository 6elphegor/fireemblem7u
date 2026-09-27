	.include "macro.inc"

	.syntax unified

	thumb_func_start SetStaffUseAction
SetStaffUseAction: @ 0x0802764C
	push {lr}
	bl HideMoveRangeGraphics
	ldr r0, _0802766C @ =0x02023C60
	movs r1, #0
	bl TmFill
	movs r0, #4
	bl EnableBgSync
	ldr r1, _08027670 @ =0x0203A85C
	movs r0, #3
	strb r0, [r1, #0x11]
	pop {r0}
	bx r0
	.align 2, 0
_0802766C: .4byte 0x02023C60
_08027670: .4byte 0x0203A85C

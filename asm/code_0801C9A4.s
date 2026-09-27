	.include "macro.inc"

	.syntax unified

	thumb_func_start PlayerPhase_CancelAction
PlayerPhase_CancelAction: @ 0x0801C9A4
	push {lr}
	ldr r2, _0801C9B8 @ =0x0203A85C
	movs r1, #0
	strb r1, [r2, #0x11]
	movs r1, #2
	bl Proc_Goto
	pop {r0}
	bx r0
	.align 2, 0
_0801C9B8: .4byte 0x0203A85C

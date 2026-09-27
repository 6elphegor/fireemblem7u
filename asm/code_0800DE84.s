	.include "macro.inc"

	.syntax unified

	thumb_func_start EvtCmd_ClearCursors
EvtCmd_ClearCursors: @ 0x0800DE84
	push {lr}
	ldr r0, _0800DE94 @ =0x08B91A50
	bl Proc_EndEach
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800DE94: .4byte 0x08B91A50

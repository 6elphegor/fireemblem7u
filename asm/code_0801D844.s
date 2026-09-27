	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenuProc_SetupActiveUnit
ConvoyMenuProc_SetupActiveUnit: @ 0x0801D844
	push {lr}
	ldr r0, _0801D858 @ =0x0203A85C
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, _0801D85C @ =0x03004690
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801D858: .4byte 0x0203A85C
_0801D85C: .4byte 0x03004690

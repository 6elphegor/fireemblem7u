	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenuProc_SendToConvoyReal
ConvoyMenuProc_SendToConvoyReal: @ 0x0801D830
	push {lr}
	ldr r0, _0801D840 @ =0x0202BBB8
	ldrh r0, [r0, #0x2e]
	bl AddItemToConvoy
	pop {r1}
	bx r1
	.align 2, 0
_0801D840: .4byte 0x0202BBB8

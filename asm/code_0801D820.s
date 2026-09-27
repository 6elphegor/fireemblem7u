	.include "macro.inc"

	.syntax unified

	thumb_func_start ConvoyMenuProc_MaybeStartSelectConvoyItem
ConvoyMenuProc_MaybeStartSelectConvoyItem: @ 0x0801D820
	push {lr}
	adds r1, r0, #0
	movs r0, #0
	bl MaybeStartSelectConvoyItemProc
	movs r0, #0
	pop {r1}
	bx r1

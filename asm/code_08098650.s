	.include "macro.inc"

	.syntax unified

	thumb_func_start WmSell_Init
WmSell_Init: @ 0x08098650
	movs r2, #0
	movs r1, #0
	strh r1, [r0, #0x34]
	movs r1, #0xff
	strh r1, [r0, #0x32]
	adds r0, #0x30
	strb r2, [r0]
	bx lr

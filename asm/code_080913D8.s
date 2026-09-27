	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepItemScreen_HideFunds
PrepItemScreen_HideFunds: @ 0x080913D8
	push {lr}
	ldr r0, _080913F8 @ =0x020230C6
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	movs r0, #0
	bl DisableSysBrownBox
	movs r0, #1
	bl EnableBgSync
	pop {r0}
	bx r0
	.align 2, 0
_080913F8: .4byte 0x020230C6

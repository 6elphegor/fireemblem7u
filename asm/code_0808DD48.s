	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSetUnitAmount
PrepSetUnitAmount: @ 0x0808DD48
	ldr r1, _0808DD54 @ =0x020116DC
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_0808DD54: .4byte 0x020116DC

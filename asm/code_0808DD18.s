	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUnitFromPrepList
GetUnitFromPrepList: @ 0x0808DD18
	ldr r1, _0808DD24 @ =0x020116DC
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808DD24: .4byte 0x020116DC

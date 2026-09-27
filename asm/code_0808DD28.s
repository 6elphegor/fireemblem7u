	.include "macro.inc"

	.syntax unified

	thumb_func_start RegisterPrepUnitList
RegisterPrepUnitList: @ 0x0808DD28
	ldr r2, _0808DD34 @ =0x020116DC
	lsls r0, r0, #2
	adds r0, r0, r2
	str r1, [r0]
	bx lr
	.align 2, 0
_0808DD34: .4byte 0x020116DC

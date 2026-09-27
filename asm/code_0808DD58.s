	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepGetLatestCharId
PrepGetLatestCharId: @ 0x0808DD58
	ldr r0, _0808DD64 @ =0x020116DC
	movs r1, #0x82
	lsls r1, r1, #1
	adds r0, r0, r1
	ldr r0, [r0]
	bx lr
	.align 2, 0
_0808DD64: .4byte 0x020116DC

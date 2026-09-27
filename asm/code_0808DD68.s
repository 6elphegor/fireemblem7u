	.include "macro.inc"

	.syntax unified

	thumb_func_start PrepSetLatestCharId
PrepSetLatestCharId: @ 0x0808DD68
	ldr r1, _0808DD74 @ =0x020116DC
	movs r2, #0x82
	lsls r2, r2, #1
	adds r1, r1, r2
	str r0, [r1]
	bx lr
	.align 2, 0
_0808DD74: .4byte 0x020116DC

	.include "macro.inc"

	.syntax unified

	thumb_func_start GetCgTextBlendControl
GetCgTextBlendControl: @ 0x08087504
	ldr r0, _0808750C @ =0x0203E738
	adds r0, #0x4c
	ldrh r0, [r0]
	bx lr
	.align 2, 0
_0808750C: .4byte 0x0203E738

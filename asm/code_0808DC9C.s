	.include "macro.inc"

	.syntax unified

	thumb_func_start ResetSioPidPool
ResetSioPidPool: @ 0x0808DC9C
	ldr r1, _0808DCAC @ =0x0203E788
	movs r2, #0
	adds r0, r1, #4
_0808DCA2:
	strb r2, [r0]
	subs r0, #1
	cmp r0, r1
	bge _0808DCA2
	bx lr
	.align 2, 0
_0808DCAC: .4byte 0x0203E788

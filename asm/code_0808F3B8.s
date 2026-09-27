	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0808F3B8
sub_0808F3B8: @ 0x0808F3B8
	adds r2, r0, #0
	ldr r0, [r2, #0x58]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _0808F3CC
	adds r1, r2, #0
	adds r1, #0x64
	movs r0, #1
	strh r0, [r1]
_0808F3CC:
	bx lr
	.align 2, 0

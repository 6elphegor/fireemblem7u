	.include "macro.inc"

	.syntax unified

	thumb_func_start ClearMenuOverrides
ClearMenuOverrides: @ 0x0804AB9C
	ldr r1, _0804ABB0 @ =0x03001458
	movs r2, #0
	adds r0, r1, #0
	adds r0, #0x78
_0804ABA4:
	strh r2, [r0, #2]
	subs r0, #8
	cmp r0, r1
	bge _0804ABA4
	bx lr
	.align 2, 0
_0804ABB0: .4byte 0x03001458

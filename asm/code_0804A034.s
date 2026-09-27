	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUiHandPrevY
GetUiHandPrevY: @ 0x0804A034
	ldr r0, _0804A03C @ =0x0203DCEC
	movs r1, #2
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804A03C: .4byte 0x0203DCEC

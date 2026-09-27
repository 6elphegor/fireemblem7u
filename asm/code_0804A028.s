	.include "macro.inc"

	.syntax unified

	thumb_func_start GetUiHandPrevX
GetUiHandPrevX: @ 0x0804A028
	ldr r0, _0804A030 @ =0x0203DCEC
	movs r1, #0
	ldrsh r0, [r0, r1]
	bx lr
	.align 2, 0
_0804A030: .4byte 0x0203DCEC

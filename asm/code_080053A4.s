	.include "macro.inc"

	.syntax unified

	thumb_func_start SetLang
SetLang: @ 0x080053A4
	ldr r1, _080053AC @ =0x02028D74
	strb r0, [r1]
	bx lr
	.align 2, 0
_080053AC: .4byte 0x02028D74

	.include "macro.inc"

	.syntax unified

	thumb_func_start AiPhaseCleanup
AiPhaseCleanup: @ 0x080349AC
	ldr r0, _080349B8 @ =0x0203A8EC
	adds r0, #0x7b
	movs r1, #0
	strb r1, [r0]
	bx lr
	.align 2, 0
_080349B8: .4byte 0x0203A8EC

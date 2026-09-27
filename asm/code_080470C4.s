	.include "macro.inc"

	.syntax unified

	thumb_func_start FE6Link_Init
FE6Link_Init: @ 0x080470C4
	ldr r1, _080470CC @ =0x0203DCE8
	movs r0, #0
	strb r0, [r1]
	bx lr
	.align 2, 0
_080470CC: .4byte 0x0203DCE8

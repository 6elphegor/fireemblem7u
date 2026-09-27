	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803DB10
sub_0803DB10: @ 0x0803DB10
	ldr r0, _0803DB20 @ =0x08B98AEC
	ldr r2, [r0]
	movs r1, #6
	ldrsb r1, [r2, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r2, #0xa]
	bx lr
	.align 2, 0
_0803DB20: .4byte 0x08B98AEC

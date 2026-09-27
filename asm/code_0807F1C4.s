	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F1C4
sub_0807F1C4: @ 0x0807F1C4
	push {lr}
	ldr r0, _0807F1D0 @ =0x083FC9EC
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1D0: .4byte 0x083FC9EC

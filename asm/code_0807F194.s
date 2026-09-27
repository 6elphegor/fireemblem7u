	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F194
sub_0807F194: @ 0x0807F194
	push {lr}
	ldr r0, _0807F1A0 @ =0x083FC9B4
	bl sub_0807BBF8
	pop {r0}
	bx r0
	.align 2, 0
_0807F1A0: .4byte 0x083FC9B4

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804AAB0
sub_0804AAB0: @ 0x0804AAB0
	push {lr}
	ldr r1, _0804AABC @ =0x08B9A910
	bl Proc_GotoScript
	pop {r1}
	bx r1
	.align 2, 0
_0804AABC: .4byte 0x08B9A910

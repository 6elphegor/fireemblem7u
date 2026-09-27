	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804A9D4
sub_0804A9D4: @ 0x0804A9D4
	push {lr}
	ldr r1, _0804A9E0 @ =0x08B9A8E8
	bl Proc_GotoScript
	pop {r1}
	bx r1
	.align 2, 0
_0804A9E0: .4byte 0x08B9A8E8

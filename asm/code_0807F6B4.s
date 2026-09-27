	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F6B4
sub_0807F6B4: @ 0x0807F6B4
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F6C4 @ =0x08CC1208
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807F6C4: .4byte 0x08CC1208

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807F45C
sub_0807F45C: @ 0x0807F45C
	push {lr}
	adds r1, r0, #0
	ldr r0, _0807F46C @ =0x08CC1198
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_0807F46C: .4byte 0x08CC1198

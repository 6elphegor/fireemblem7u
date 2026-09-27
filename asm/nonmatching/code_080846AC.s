	.include "macro.inc"

	.syntax unified

	thumb_func_start StartNoBoxTalk
StartNoBoxTalk: @ 0x080846AC
	push {lr}
	ldr r0, _080846BC @ =0x08CC2B84
	movs r1, #0
	bl Proc_Start
	pop {r0}
	bx r0
	.align 2, 0
_080846BC: .4byte 0x08CC2B84

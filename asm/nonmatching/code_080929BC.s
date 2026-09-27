	.include "macro.inc"

	.syntax unified

	thumb_func_start StartPrepItemScreen
StartPrepItemScreen: @ 0x080929BC
	push {lr}
	adds r1, r0, #0
	ldr r0, _080929CC @ =0x08CC4448
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080929CC: .4byte 0x08CC4448

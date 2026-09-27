	.include "macro.inc"

	.syntax unified

	thumb_func_start SioWarpFx_AwaitSioWarp
SioWarpFx_AwaitSioWarp: @ 0x080479DC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080479FC @ =0x08B9A298
	bl Proc_Find
	rsbs r1, r0, #0
	orrs r1, r0
	cmp r1, #0
	blt _080479F4
	adds r0, r4, #0
	bl Proc_Break
_080479F4:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080479FC: .4byte 0x08B9A298

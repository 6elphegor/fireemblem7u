	.include "macro.inc"

	.syntax unified

	thumb_func_start SaveBgUp_Loop
SaveBgUp_Loop: @ 0x080A6368
	push {lr}
	ldr r0, _080A637C @ =0x02023C60
	ldr r1, _080A6380 @ =0x06007000
	movs r2, #0x80
	lsls r2, r2, #4
	bl RegisterDataMove
	pop {r0}
	bx r0
	.align 2, 0
_080A637C: .4byte 0x02023C60
_080A6380: .4byte 0x06007000

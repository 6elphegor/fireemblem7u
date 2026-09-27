	.include "macro.inc"

	.syntax unified

	thumb_func_start ReadSuspendSavePlaySt
ReadSuspendSavePlaySt: @ 0x080A13D8
	push {lr}
	ldr r2, _080A13E8 @ =0x0203ECC4
	ldrb r2, [r2]
	adds r0, r2, r0
	bl ReadGameSavePlaySt
	pop {r0}
	bx r0
	.align 2, 0
_080A13E8: .4byte 0x0203ECC4

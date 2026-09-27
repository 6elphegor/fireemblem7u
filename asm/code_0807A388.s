	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A388
sub_0807A388: @ 0x0807A388
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A3A0 @ =0x00001387
	cmp r0, r1
	ble _0807A398
	movs r2, #1
_0807A398:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A3A0: .4byte 0x00001387

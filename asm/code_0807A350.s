	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A350
sub_0807A350: @ 0x0807A350
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A368 @ =0x00001F3F
	cmp r0, r1
	ble _0807A360
	movs r2, #1
_0807A360:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A368: .4byte 0x00001F3F

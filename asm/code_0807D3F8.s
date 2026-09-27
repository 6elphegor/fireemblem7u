	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807D3F8
sub_0807D3F8: @ 0x0807D3F8
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807D410 @ =0x00004E1F
	cmp r0, r1
	ble _0807D408
	movs r2, #1
_0807D408:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807D410: .4byte 0x00004E1F

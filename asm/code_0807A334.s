	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807A334
sub_0807A334: @ 0x0807A334
	push {lr}
	bl GetGold
	movs r2, #0
	ldr r1, _0807A34C @ =0x0000270F
	cmp r0, r1
	ble _0807A344
	movs r2, #1
_0807A344:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_0807A34C: .4byte 0x0000270F

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013CB4
sub_08013CB4: @ 0x08013CB4
	push {r4, lr}
	movs r4, #0
_08013CB8:
	adds r0, r4, #0
	bl SetBlackPal
	adds r4, #1
	cmp r4, #0x1f
	ble _08013CB8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

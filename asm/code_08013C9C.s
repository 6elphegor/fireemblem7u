	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08013C9C
sub_08013C9C: @ 0x08013C9C
	push {r4, lr}
	movs r4, #0
_08013CA0:
	adds r0, r4, #0
	bl SetBlackPal
	adds r4, #1
	cmp r4, #0x1f
	ble _08013CA0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

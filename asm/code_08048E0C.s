	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08048E0C
sub_08048E0C: @ 0x08048E0C
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_08048E12:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_08048DF4
	adds r4, #1
	cmp r4, #4
	ble _08048E12
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

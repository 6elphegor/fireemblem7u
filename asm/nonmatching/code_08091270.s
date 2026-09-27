	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08091270
sub_08091270: @ 0x08091270
	push {r4, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	movs r2, #0
	movs r1, #0
	movs r4, #1
_0809127C:
	adds r0, r3, #0
	asrs r0, r1
	ands r0, r4
	cmp r0, #0
	beq _08091288
	adds r2, #1
_08091288:
	adds r1, #1
	cmp r1, #0xf
	ble _0809127C
	adds r0, r2, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08010464
sub_08010464: @ 0x08010464
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r0, r1, #0x18
	cmp r2, #0
	beq _08010488
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _08010482
	adds r1, r2, #0
	adds r1, #0x48
	movs r0, #0x80
	lsls r0, r0, #3
	strh r0, [r1]
	b _08010488
_08010482:
	adds r0, r2, #0
	adds r0, #0x48
	strh r1, [r0]
_08010488:
	bx lr
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08054A68
sub_08054A68: @ 0x08054A68
	adds r1, r0, #0
	ldr r0, _08054A88 @ =0x0000FFFE
	strh r0, [r1, #0xe]
	movs r0, #8
	ldrh r2, [r1, #0x10]
	ands r0, r2
	cmp r0, #0
	beq _08054A84
	strh r0, [r1, #0x10]
	movs r0, #0
	strh r0, [r1, #0xe]
	ldr r0, [r1, #0x20]
	adds r0, #4
	str r0, [r1, #0x20]
_08054A84:
	bx lr
	.align 2, 0
_08054A88: .4byte 0x0000FFFE

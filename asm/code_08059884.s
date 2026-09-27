	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08059884
sub_08059884: @ 0x08059884
	adds r1, r0, #0
	ldr r2, [r1, #0x60]
	ldrh r0, [r1, #0x2c]
	adds r0, #1
	movs r3, #0
	strh r0, [r1, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bne _080598A2
	ldr r0, _080598A4 @ =0x08BB9AAC
	str r0, [r2, #0x24]
	str r0, [r2, #0x20]
	strh r3, [r2, #6]
	strh r3, [r1, #0x2c]
_080598A2:
	bx lr
	.align 2, 0
_080598A4: .4byte 0x08BB9AAC

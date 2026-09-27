	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080476C8
sub_080476C8: @ 0x080476C8
	ldr r0, [r0, #0x2c]
	ldr r2, [r0, #0x30]
	ldr r1, [r0, #0x34]
	movs r0, #0xf
	ldrb r3, [r1, #1]
	ands r0, r3
	lsls r0, r0, #0xc
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	strh r0, [r2, #0x22]
	bx lr

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800AA18
sub_0800AA18: @ 0x0800AA18
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x34
	movs r0, #0xff
	ldrb r1, [r2]
	orrs r1, r0
	strb r1, [r2]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r2, [r1]
	orrs r0, r2
	strb r0, [r1]
	adds r0, r3, #0
	adds r0, #0x3b
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0800AA48 @ =0x0000FFFF
	strh r0, [r3, #0x3e]
	adds r0, r3, #0
	adds r0, #0x44
	strb r1, [r0]
	adds r0, #4
	strh r1, [r0]
	bx lr
	.align 2, 0
_0800AA48: .4byte 0x0000FFFF

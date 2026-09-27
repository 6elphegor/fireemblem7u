	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0803E904
sub_0803E904: @ 0x0803E904
	movs r1, #0
	ldr r2, _0803E920 @ =0x0203D90C
	ldrb r0, [r2, #5]
	adds r0, #2
	cmp r1, r0
	bge _0803E92A
	adds r3, r2, #6
	adds r2, r0, #0
_0803E914:
	adds r0, r1, r3
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _0803E924
	movs r0, #0
	b _0803E92C
	.align 2, 0
_0803E920: .4byte 0x0203D90C
_0803E924:
	adds r1, #1
	cmp r1, r2
	blt _0803E914
_0803E92A:
	movs r0, #1
_0803E92C:
	bx lr
	.align 2, 0

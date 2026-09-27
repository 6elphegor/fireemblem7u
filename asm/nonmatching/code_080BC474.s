	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BC474
sub_080BC474: @ 0x080BC474
	ldr r2, _080BC490 @ =0x03002870
	movs r0, #1
	ldrb r1, [r2, #1]
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bx lr
	.align 2, 0
_080BC490: .4byte 0x03002870

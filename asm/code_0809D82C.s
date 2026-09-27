	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809D82C
sub_0809D82C: @ 0x0809D82C
	ldr r2, _0809D840 @ =0x02014434
	ldr r1, [r2]
	movs r0, #0xd
	muls r0, r1, r0
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [r2]
	bx lr
	.align 2, 0
_0809D840: .4byte 0x02014434

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A2948
sub_080A2948: @ 0x080A2948
	ldr r2, _080A2958 @ =0x02000500
	ldr r3, [r2]
	ldr r1, _080A295C @ =0x02000504
	ldr r0, [r1]
	str r0, [r2]
	str r3, [r1]
	bx lr
	.align 2, 0
_080A2958: .4byte 0x02000500
_080A295C: .4byte 0x02000504

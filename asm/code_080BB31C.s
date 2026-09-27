	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BB31C
sub_080BB31C: @ 0x080BB31C
	ldr r0, _080BB328 @ =0x02007500
	ldr r2, [r0]
	ldr r1, [r0, #4]
	str r1, [r0]
	str r2, [r0, #4]
	bx lr
	.align 2, 0
_080BB328: .4byte 0x02007500

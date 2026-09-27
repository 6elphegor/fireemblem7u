	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0800502C
sub_0800502C: @ 0x0800502C
	ldr r1, _0800503C @ =0x02028D44
	ldr r0, _08005040 @ =0x20202020
	stm r1!, {r0}
	str r0, [r1]
	ldr r1, _0800503C @ =0x02028D44
	movs r0, #0
	strb r0, [r1, #8]
	bx lr
	.align 2, 0
_0800503C: .4byte 0x02028D44
_08005040: .4byte 0x20202020

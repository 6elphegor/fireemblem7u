	.include "macro.inc"

	.syntax unified

	thumb_func_start RemoveTrap
RemoveTrap: @ 0x0802BB10
	adds r2, r0, #0
	b _0802BB1A
_0802BB14:
	ldr r0, [r2, #8]
	ldr r1, [r2, #0xc]
	stm r2!, {r0, r1}
_0802BB1A:
	ldrb r0, [r2, #2]
	cmp r0, #0
	bne _0802BB14
	bx lr
	.align 2, 0

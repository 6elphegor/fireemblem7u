	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802217C
sub_0802217C: @ 0x0802217C
	ldr r0, _08022194 @ =0x03004690
	ldr r2, [r0]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022198
	ldrh r0, [r2, #0x1e]
	cmp r0, #0
	beq _08022198
	movs r0, #1
	b _0802219A
	.align 2, 0
_08022194: .4byte 0x03004690
_08022198:
	movs r0, #3
_0802219A:
	bx lr

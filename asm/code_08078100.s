	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078100
sub_08078100: @ 0x08078100
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	cmp r0, #0
	beq _0807811A
	ldr r0, [r4, #8]
	bl SetFlag
	ldr r0, [r4, #4]
	cmp r0, #1
	beq _0807811A
	bl sub_0800AF5C
_0807811A:
	pop {r4}
	pop {r0}
	bx r0

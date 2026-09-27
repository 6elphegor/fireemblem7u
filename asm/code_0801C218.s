	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C218
sub_0801C218: @ 0x0801C218
	adds r1, r0, #0
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x49
	beq _0801C22E
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x9e
	beq _0801C22E
	movs r0, #1
	b _0801C230
_0801C22E:
	movs r0, #0
_0801C230:
	bx lr
	.align 2, 0

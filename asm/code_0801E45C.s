	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801E45C
sub_0801E45C: @ 0x0801E45C
	adds r1, r0, #0
	ldr r2, [r1, #0x2c]
	movs r3, #0x34
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801E46A
	adds r0, #0xf
_0801E46A:
	asrs r0, r0, #4
	strb r0, [r2, #0x10]
	ldr r2, [r1, #0x2c]
	movs r3, #0x36
	ldrsh r0, [r1, r3]
	cmp r0, #0
	bge _0801E47A
	adds r0, #0xf
_0801E47A:
	asrs r0, r0, #4
	strb r0, [r2, #0x11]
	bx lr

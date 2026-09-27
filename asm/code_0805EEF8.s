	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805EEF8
sub_0805EEF8: @ 0x0805EEF8
	push {lr}
	ldr r0, [r0, #0x60]
	bl AnimDelete
	ldr r1, _0805EF0C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0805EF0C: .4byte 0x0201774C

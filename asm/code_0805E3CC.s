	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805E3CC
sub_0805E3CC: @ 0x0805E3CC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0805E3E8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805E3EC @ =0x08BA341C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0805E3E8: .4byte 0x0201774C
_0805E3EC: .4byte 0x08BA341C

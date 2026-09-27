	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080591EC
sub_080591EC: @ 0x080591EC
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08059208 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0805920C @ =0x08BA1DD4
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059208: .4byte 0x0201774C
_0805920C: .4byte 0x08BA1DD4

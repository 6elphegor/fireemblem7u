	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080780C4
sub_080780C4: @ 0x080780C4
	push {r7, lr}
	sub sp, #0x14
	add r7, sp, #4
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	str r3, [r7, #0xc]
	ldr r0, _080780FC @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _080780FC @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7, #0xc]
	str r1, [sp]
	ldr r1, [r7]
	bl sub_08077EB8
	bl SwapScanlineBufs
	add sp, #0x14
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080780FC: .4byte 0x0203E660

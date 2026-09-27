	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080769CC
sub_080769CC: @ 0x080769CC
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _080769FC @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _080769FC @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl MapAnimScanlineCore
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080769FC: .4byte 0x0203E660

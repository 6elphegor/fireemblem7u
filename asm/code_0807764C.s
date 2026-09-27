	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807764C
sub_0807764C: @ 0x0807764C
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, _0807767C @ =0x0203E660
	ldr r1, [r0, #4]
	adds r0, r1, #0
	bl InitScanlineBuf
	ldr r1, _0807767C @ =0x0203E660
	ldr r0, [r1, #4]
	ldr r2, [r7, #4]
	ldr r3, [r7, #8]
	ldr r1, [r7]
	bl sub_0807754C
	bl SwapScanlineBufs
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807767C: .4byte 0x0203E660

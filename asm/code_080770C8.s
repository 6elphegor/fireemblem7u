	.include "macro.inc"

	.syntax unified

	thumb_func_start SwapScanlineBufs
SwapScanlineBufs: @ 0x080770C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r0, _080770EC @ =0x0203E660
	ldr r1, [r0]
	str r1, [r7]
	ldr r0, _080770EC @ =0x0203E660
	ldr r1, _080770EC @ =0x0203E660
	ldr r2, [r1, #4]
	str r2, [r0]
	ldr r0, _080770EC @ =0x0203E660
	ldr r1, [r7]
	str r1, [r0, #4]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080770EC: .4byte 0x0203E660

	.include "macro.inc"

	.syntax unified

	thumb_func_start GetScanlineBuf
GetScanlineBuf: @ 0x0807751C
	push {r7, lr}
	sub sp, #8
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r0, _08077540 @ =0x0203E660
	ldr r1, [r7]
	adds r2, r1, #0
	lsls r1, r2, #2
	adds r0, r0, r1
	ldr r1, [r7, #4]
	adds r2, r1, #0
	lsls r1, r2, #1
	ldr r0, [r0]
	adds r1, r1, r0
	adds r0, r1, #0
	b _08077544
	.align 2, 0
_08077540: .4byte 0x0203E660
_08077544:
	add sp, #8
	pop {r7}
	pop {r1}
	bx r1

	.include "macro.inc"

	.syntax unified

	thumb_func_start GetMuImg
GetMuImg: @ 0x0806D554
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806D574 @ =0x08C9D174
	ldr r2, [r7]
	adds r1, r2, #0
	adds r2, #0x41
	ldrb r1, [r2]
	subs r2, r1, #1
	adds r1, r2, #0
	lsls r2, r1, #3
	adds r0, r0, r2
	ldr r1, [r0]
	adds r0, r1, #0
	b _0806D578
	.align 2, 0
_0806D574: .4byte 0x08C9D174
_0806D578:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

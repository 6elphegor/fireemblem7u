	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806D524
sub_0806D524: @ 0x0806D524
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _0806D544 @ =0x08C9D03E
	ldr r1, [r7]
	adds r2, r0, r1
	ldrb r0, [r2]
	adds r2, r0, #0
	lsls r1, r2, #4
	adds r1, r1, r0
	lsls r0, r1, #9
	ldr r2, _0806D548 @ =0x020040F0
	adds r1, r0, r2
	adds r0, r1, #0
	b _0806D54C
	.align 2, 0
_0806D544: .4byte 0x08C9D03E
_0806D548: .4byte 0x020040F0
_0806D54C:
	add sp, #4
	pop {r7}
	pop {r1}
	bx r1

	.include "macro.inc"

	.syntax unified

	thumb_func_start SetVCount
SetVCount: @ 0x08001990
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _080019B4 @ =0x03002870
	ldr r2, [r7]
	adds r1, r2, #0
	ldrb r2, [r0, #5]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0, #5]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_080019B4: .4byte 0x03002870

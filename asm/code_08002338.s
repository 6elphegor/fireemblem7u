	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08002338
sub_08002338: @ 0x08002338
	push {r7, lr}
	sub sp, #0x10
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	str r2, [r7, #8]
	ldr r0, [r7]
	str r0, [r7, #0xc]
_08002348:
	ldr r0, [r7]
	ldr r1, [r7, #4]
	adds r0, r0, r1
	ldr r1, [r7, #0xc]
	cmp r1, r0
	blt _08002356
	b _0800237C
_08002356:
	ldr r0, _08002378 @ =0x02022240
	ldr r1, [r7, #0xc]
	adds r0, r0, r1
	ldr r2, [r7, #8]
	adds r1, r2, #0
	ldrb r2, [r0]
	movs r3, #0
	ands r2, r3
	adds r3, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
	ldr r0, [r7, #0xc]
	adds r1, r0, #1
	str r1, [r7, #0xc]
	b _08002348
	.align 2, 0
_08002378: .4byte 0x02022240
_0800237C:
	add sp, #0x10
	pop {r7}
	pop {r0}
	bx r0

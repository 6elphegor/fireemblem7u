	.include "macro.inc"

	.syntax unified

	thumb_func_start SetBgBpp
SetBgBpp: @ 0x08001518
	push {r7, lr}
	sub sp, #0xc
	mov r7, sp
	str r0, [r7]
	str r1, [r7, #4]
	ldr r1, [r7]
	adds r0, r1, #0
	lsls r2, r0, #0x10
	lsrs r1, r2, #0x10
	adds r0, r1, #0
	bl GetBgCt
	str r0, [r7, #8]
	ldr r0, [r7, #8]
	movs r1, #0
	ldr r2, [r7, #4]
	cmp r2, #8
	bne _0800153E
	movs r1, #1
_0800153E:
	adds r2, r1, #0
	lsls r1, r2, #7
	ldrb r2, [r0]
	movs r3, #0x7f
	ands r2, r3
	adds r3, r2, #0
	adds r2, r3, #0
	orrs r2, r1
	adds r1, r2, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

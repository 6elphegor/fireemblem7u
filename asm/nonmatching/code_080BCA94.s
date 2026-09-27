	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080BCA94
sub_080BCA94: @ 0x080BCA94
	push {r4, lr}
	ldr r4, [r0, #0x2c]
	adds r3, r4, #1
	str r3, [r0, #0x2c]
	cmp r3, #0x80
	bgt _080BCADC
	ldr r0, _080BCAD8 @ =0x03002870
	mov ip, r0
	adds r0, #0x3c
	movs r1, #0x3f
	ldrb r2, [r0]
	ands r1, r2
	movs r2, #0x40
	orrs r1, r2
	strb r1, [r0]
	adds r1, r3, #0
	cmp r1, #0
	bge _080BCABC
	adds r1, r4, #0
	adds r1, #8
_080BCABC:
	asrs r1, r1, #3
	mov r0, ip
	adds r0, #0x44
	movs r2, #0
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x45
	movs r0, #0x10
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x46
	strb r2, [r0]
	b _080BCAE0
	.align 2, 0
_080BCAD8: .4byte 0x03002870
_080BCADC:
	bl Proc_Break
_080BCAE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

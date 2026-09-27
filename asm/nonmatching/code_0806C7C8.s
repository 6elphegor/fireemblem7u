	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806C7C8
sub_0806C7C8: @ 0x0806C7C8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl sub_0806C7A4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	bne _0806C7F4
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	movs r3, #3
	adds r1, r2, #0
	orrs r1, r3
	adds r2, r1, #0
	strb r2, [r0]
_0806C7F4:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

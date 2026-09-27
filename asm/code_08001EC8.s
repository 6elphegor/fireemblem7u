	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08001EC8
sub_08001EC8: @ 0x08001EC8
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	adds r2, r0, #0
	adds r0, r1, #0
	adds r1, r7, #0
	strb r2, [r1]
	adds r1, r7, #1
	strb r0, [r1]
	ldr r0, _08001EF4 @ =0x03000014
	adds r1, r7, #0
	ldrb r2, [r1]
	strb r2, [r0]
	ldr r0, _08001EF8 @ =0x03000015
	adds r1, r7, #1
	ldrb r2, [r1]
	strb r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001EF4: .4byte 0x03000014
_08001EF8: .4byte 0x03000015

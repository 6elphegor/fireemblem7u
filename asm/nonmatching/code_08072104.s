	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072104
sub_08072104: @ 0x08072104
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08072120 @ =0x0000010F
	ldr r1, [r7]
	ldr r2, [r1, #0x30]
	adds r1, r2, #0
	bl PlaySeSpacial
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08072120: .4byte 0x0000010F

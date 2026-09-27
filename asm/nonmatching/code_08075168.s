	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075168
sub_08075168: @ 0x08075168
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	cmp r0, #0
	beq _08075188
	ldr r1, _08075184 @ =0x08C9DF2C
	adds r0, r1, #0
	ldr r1, [r7]
	bl Proc_StartBlocking
	b _08075192
	.align 2, 0
_08075184: .4byte 0x08C9DF2C
_08075188:
	ldr r1, _0807519C @ =0x08C9DF2C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
_08075192:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807519C: .4byte 0x08C9DF2C

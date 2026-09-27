	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806E144
sub_0806E144: @ 0x0806E144
	push {r7, lr}
	mov r7, sp
	ldr r0, _0806E158 @ =0x08C9D00C
	ldr r1, _0806E15C @ =sub_0806E160
	bl Proc_ForEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806E158: .4byte 0x08C9D00C
_0806E15C: .4byte sub_0806E160

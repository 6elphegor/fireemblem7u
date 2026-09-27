	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807453C
sub_0807453C: @ 0x0807453C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08074550 @ =0x08C9DE2C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08074550: .4byte 0x08C9DE2C

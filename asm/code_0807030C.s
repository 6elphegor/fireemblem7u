	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807030C
sub_0807030C: @ 0x0807030C
	push {r7, lr}
	mov r7, sp
	ldr r1, _08070320 @ =0x08C9D93C
	adds r0, r1, #0
	movs r1, #3
	bl Proc_Start
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070320: .4byte 0x08C9D93C

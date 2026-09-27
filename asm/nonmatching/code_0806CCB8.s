	.include "macro.inc"

	.syntax unified

	thumb_func_start EndAllMus
EndAllMus: @ 0x0806CCB8
	push {r7, lr}
	mov r7, sp
	ldr r1, _0806CCCC @ =0x08C9D00C
	adds r0, r1, #0
	bl Proc_EndEach
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806CCCC: .4byte 0x08C9D00C

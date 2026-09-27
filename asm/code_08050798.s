	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08050798
sub_08050798: @ 0x08050798
	push {lr}
	sub sp, #4
	ldr r1, _080507B0 @ =0x0201C8C4
	str r0, [sp]
	ldr r2, _080507B4 @ =0x050002D6
	mov r0, sp
	bl CpuSet
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080507B0: .4byte 0x0201C8C4
_080507B4: .4byte 0x050002D6

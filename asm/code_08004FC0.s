	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08004FC0
sub_08004FC0: @ 0x08004FC0
	push {r1, r2, r3}
	push {lr}
	sub sp, #0x100
	mov r1, sp
	bl DebugPutStr
	add sp, #0x100
	pop {r3}
	add sp, #0xc
	bx r3

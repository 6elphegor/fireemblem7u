	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08072C0C
sub_08072C0C: @ 0x08072C0C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ResetScanLineHBlank
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

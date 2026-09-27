	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08075094
sub_08075094: @ 0x08075094
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

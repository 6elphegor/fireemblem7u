	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08074460
sub_08074460: @ 0x08074460
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl EndEachSpriteAnimProc
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	.include "macro.inc"

	.syntax unified

	thumb_func_start SetkeyStIgnoredMask
SetkeyStIgnoredMask: @ 0x08001CD0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08001CE8 @ =0x0300000E
	ldr r1, [r7]
	adds r2, r1, #0
	strh r2, [r0]
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001CE8: .4byte 0x0300000E

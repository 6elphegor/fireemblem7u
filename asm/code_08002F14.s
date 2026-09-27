	.include "macro.inc"

	.syntax unified

	thumb_func_start SetOnHBlankA
SetOnHBlankA: @ 0x08002F14
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002F30 @ =0x03002924
	ldr r1, [r7]
	str r1, [r0]
	bl RefreshOnHBlank
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F30: .4byte 0x03002924

	.include "macro.inc"

	.syntax unified

	thumb_func_start SetOnHBlankB
SetOnHBlankB: @ 0x08002F34
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, _08002F50 @ =0x03002F38
	ldr r1, [r7]
	str r1, [r0]
	bl RefreshOnHBlank
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08002F50: .4byte 0x03002F38

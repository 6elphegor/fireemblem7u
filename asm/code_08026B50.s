	.include "macro.inc"

	.syntax unified

	thumb_func_start GetSupportLevelSpecialChar
GetSupportLevelSpecialChar: @ 0x08026B50
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _08026B70 @ =0x081C3CC0
	mov r0, sp
	movs r2, #4
	bl memcpy
	mov r1, sp
	adds r0, r1, r4
	ldrb r0, [r0]
	add sp, #4
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08026B70: .4byte 0x081C3CC0

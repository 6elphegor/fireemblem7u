	.include "macro.inc"

	.syntax unified

	thumb_func_start GetGameTime
GetGameTime: @ 0x08000F14
	push {r7, lr}
	mov r7, sp
	ldr r0, _08000F20 @ =0x03000010
	ldr r1, [r0]
	adds r0, r1, #0
	b _08000F24
	.align 2, 0
_08000F20: .4byte 0x03000010
_08000F24:
	pop {r7}
	pop {r1}
	bx r1
	.align 2, 0

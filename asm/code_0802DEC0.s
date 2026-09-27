	.include "macro.inc"

	.syntax unified

	thumb_func_start GetTextPrintDelay
GetTextPrintDelay: @ 0x0802DEC0
	push {lr}
	sub sp, #4
	ldr r1, _0802DEE4 @ =0x081C4038
	mov r0, sp
	movs r2, #4
	bl memcpy
	ldr r0, _0802DEE8 @ =0x0202BBF8
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1e
	add r0, sp
	ldrb r0, [r0]
	add sp, #4
	pop {r1}
	bx r1
	.align 2, 0
_0802DEE4: .4byte 0x081C4038
_0802DEE8: .4byte 0x0202BBF8

	.include "macro.inc"

	.syntax unified

	thumb_func_start MapMenu_Suspend_Available
MapMenu_Suspend_Available: @ 0x08021544
	ldr r1, _08021554 @ =0x0202BBF8
	movs r0, #8
	ldrb r1, [r1, #0x14]
	ands r0, r1
	cmp r0, #0
	bne _08021558
	movs r0, #1
	b _0802155A
	.align 2, 0
_08021554: .4byte 0x0202BBF8
_08021558:
	movs r0, #2
_0802155A:
	bx lr

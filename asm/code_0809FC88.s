	.include "macro.inc"

	.syntax unified

	thumb_func_start IsChapterPartOfCurrentMode
IsChapterPartOfCurrentMode: @ 0x0809FC88
	adds r1, r0, #0
	ldr r0, _0809FC9C @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	bne _0809FCA0
	cmp r1, #0xb
	bgt _0809FCAC
_0809FC96:
	movs r0, #1
	b _0809FCAE
	.align 2, 0
_0809FC9C: .4byte 0x0202BBF8
_0809FCA0:
	cmp r0, #1
	blt _0809FCAC
	cmp r0, #3
	bgt _0809FCAC
	cmp r1, #0xb
	bgt _0809FC96
_0809FCAC:
	movs r0, #0
_0809FCAE:
	bx lr

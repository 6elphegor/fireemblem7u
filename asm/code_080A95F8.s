	.include "macro.inc"

	.syntax unified

	thumb_func_start SysGrayBox_Init
SysGrayBox_Init: @ 0x080A95F8
	movs r2, #0
	movs r1, #3
	adds r0, #0x50
_080A95FE:
	strb r2, [r0]
	subs r0, #0xc
	subs r1, #1
	cmp r1, #0
	bge _080A95FE
	bx lr
	.align 2, 0

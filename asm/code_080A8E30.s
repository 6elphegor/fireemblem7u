	.include "macro.inc"

	.syntax unified

	thumb_func_start SysBlackBox_Init
SysBlackBox_Init: @ 0x080A8E30
	movs r2, #0
	movs r1, #3
	adds r0, #0x4d
_080A8E36:
	strb r2, [r0]
	subs r0, #1
	subs r1, #1
	cmp r1, #0
	bge _080A8E36
	bx lr
	.align 2, 0

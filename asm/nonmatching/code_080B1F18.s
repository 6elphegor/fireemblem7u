	.include "macro.inc"

	.syntax unified

	thumb_func_start _DisplayShopUiArrows
_DisplayShopUiArrows: @ 0x080B1F18
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl DisplayShopUiArrows
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

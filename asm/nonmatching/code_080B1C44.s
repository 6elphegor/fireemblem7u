	.include "macro.inc"

	.syntax unified

	thumb_func_start InitShopSellStatus
InitShopSellStatus: @ 0x080B1C44
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl Shop_InitSellState
	ldr r0, [r7]
	ldr r1, [r0, #0x54]
	adds r0, r1, #0
	bl ShopDrawDefaultSellItemLine
	ldr r0, [r7]
	bl Proc_Break
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

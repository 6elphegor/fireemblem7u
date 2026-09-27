	.include "macro.inc"

	.syntax unified

	thumb_func_start Shop_SellAnythingElseDialogue
Shop_SellAnythingElseDialogue: @ 0x080B0FE4
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #0x1e
	ldr r1, [r7]
	bl StartShopDialogue
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

	.include "macro.inc"

	.syntax unified

	thumb_func_start Shop_PrepEntryDialogue
Shop_PrepEntryDialogue: @ 0x080B1094
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	movs r0, #5
	ldr r1, [r7]
	bl StartShopDialogue
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

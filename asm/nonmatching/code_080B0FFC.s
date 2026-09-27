	.include "macro.inc"

	.syntax unified

	thumb_func_start Shop_AnythingElseRestartDialogue
Shop_AnythingElseRestartDialogue: @ 0x080B0FFC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	adds r1, r0, #0
	adds r0, #0x5c
	ldrb r1, [r0]
	movs r2, #0
	ands r1, r2
	adds r2, r1, #0
	strb r2, [r0]
	movs r0, #0xc
	ldr r1, [r7]
	bl StartShopDialogue
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

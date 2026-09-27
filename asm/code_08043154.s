	.include "macro.inc"

	.syntax unified

	thumb_func_start Shop_HandleBuyConfirmPrompt
Shop_HandleBuyConfirmPrompt: @ 0x08043154
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _08043168
	adds r0, r4, #0
	movs r1, #1
	bl EventGotoLabel
_08043168:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

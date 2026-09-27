	.include "macro.inc"

	.syntax unified

	thumb_func_start AtMenu_UpdateDesc
AtMenu_UpdateDesc: @ 0x0808E980
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl GetActivePrepMenuItemIndex
	adds r6, r0, #0
	adds r4, r5, #0
	adds r4, #0x35
	ldrb r0, [r4]
	cmp r0, r6
	beq _0808E9A0
	bl GetPrepMainMenuInfoxMsg
	adds r1, r5, #0
	bl StartPrepMenuDescHandler
	strb r6, [r4]
_0808E9A0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

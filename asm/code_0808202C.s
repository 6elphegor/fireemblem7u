	.include "macro.inc"

	.syntax unified

	thumb_func_start MoveHelpPromptSprite
MoveHelpPromptSprite: @ 0x0808202C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08082048 @ =0x08CC209C
	bl Proc_Find
	cmp r0, #0
	beq _08082040
	str r4, [r0, #0x2c]
	str r5, [r0, #0x30]
_08082040:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08082048: .4byte 0x08CC209C

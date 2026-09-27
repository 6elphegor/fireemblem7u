	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08021614
sub_08021614: @ 0x08021614
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _08021628
	adds r0, r4, #0
	movs r1, #0x63
	bl EventGotoLabel
_08021628:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

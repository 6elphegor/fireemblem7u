	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7D88
sub_080B7D88: @ 0x080B7D88
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	bne _080B7D9E
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080B7DA6
_080B7D9E:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080B7DA6:
	pop {r4}
	pop {r0}
	bx r0

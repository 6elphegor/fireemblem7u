	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B7E20
sub_080B7E20: @ 0x080B7E20
	push {lr}
	bl GetTalkChoiceResult
	cmp r0, #2
	bne _080B7E32
	movs r0, #5
	bl SetNextGameAction
	b _080B7E38
_080B7E32:
	movs r0, #0xc
	bl SetNextGameAction
_080B7E38:
	pop {r0}
	bx r0

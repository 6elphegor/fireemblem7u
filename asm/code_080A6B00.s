	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A6B00
sub_080A6B00: @ 0x080A6B00
	push {r4, lr}
	adds r4, r0, #0
	bl GetTalkChoiceResult
	cmp r0, #2
	beq _080A6B14
	bl GetTalkChoiceResult
	cmp r0, #0
	bne _080A6B1C
_080A6B14:
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080A6B1C:
	bl GetTalkChoiceResult
	cmp r0, #1
	bne _080A6B2C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080A6B2C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

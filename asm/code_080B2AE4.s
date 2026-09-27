	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2AE4
sub_080B2AE4: @ 0x080B2AE4
	push {r4, r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B2B16
	cmp r0, #1
	bgt _080B2AFE
	cmp r0, #0
	beq _080B2B04
	b _080B2B04
_080B2AFE:
	cmp r0, #2
	beq _080B2B04
	b _080B2B04
_080B2B04:
	movs r0, #0x43
	ldr r1, [r7]
	bl sub_080B2DAC
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b _080B2B3A
_080B2B16:
	bl ArenaGetMatchupGoldValue
	adds r4, r0, #0
	bl GetGold
	cmp r4, r0
	bgt _080B2B28
	b _080B2B3A
_080B2B26:
	.byte 0x07, 0xE0
_080B2B28:
	movs r0, #0x49
	ldr r1, [r7]
	bl sub_080B2DAC
	ldr r0, [r7]
	movs r1, #2
	bl Proc_Goto
	b _080B2B3A
_080B2B3A:
	add sp, #4
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0

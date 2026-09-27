	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B062C
sub_080B062C: @ 0x080B062C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B0656
	cmp r0, #1
	bgt _080B0646
	cmp r0, #0
	beq _080B064C
	b _080B064C
_080B0646:
	cmp r0, #2
	beq _080B0660
	b _080B064C
_080B064C:
	ldr r0, [r7]
	movs r1, #0xc
	bl Proc_Goto
	b _080B0688
_080B0656:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B0688
_080B0660:
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	adds r0, r1, #0
	bl GetUnitItemCount
	cmp r0, #0
	bne _080B0680
	movs r0, #0x1b
	ldr r1, [r7]
	bl sub_080B034C
	ldr r0, [r7]
	movs r1, #7
	bl Proc_Goto
	b _080B0688
_080B0680:
	ldr r0, [r7]
	movs r1, #4
	bl Proc_Goto
_080B0688:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

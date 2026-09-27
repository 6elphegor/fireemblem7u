	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0AAC
sub_080B0AAC: @ 0x080B0AAC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B0ACC
	cmp r0, #1
	bgt _080B0AC6
	cmp r0, #0
	beq _080B0ACE
	b _080B0ACE
_080B0AC6:
	cmp r0, #2
	beq _080B0ACE
	b _080B0ACE
_080B0ACC:
	b _080B0AD8
_080B0ACE:
	ldr r0, [r7]
	movs r1, #1
	bl Proc_Goto
	b _080B0AD8
_080B0AD8:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

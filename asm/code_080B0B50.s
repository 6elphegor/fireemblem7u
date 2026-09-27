	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0B50
sub_080B0B50: @ 0x080B0B50
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl GetTalkChoiceResult
	cmp r0, #1
	beq _080B0B70
	cmp r0, #1
	bgt _080B0B6A
	cmp r0, #0
	beq _080B0B72
	b _080B0B72
_080B0B6A:
	cmp r0, #2
	beq _080B0B72
	b _080B0B72
_080B0B70:
	b _080B0B7C
_080B0B72:
	ldr r0, [r7]
	movs r1, #0xb
	bl Proc_Goto
	b _080B0B7C
_080B0B7C:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

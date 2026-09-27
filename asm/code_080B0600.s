	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0600
sub_080B0600: @ 0x080B0600
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x2c]
	cmp r1, #0
	bne _080B061A
	ldr r0, [r7]
	movs r1, #0xd
	bl Proc_Goto
	b _080B0622
_080B061A:
	movs r0, #9
	ldr r1, [r7]
	bl sub_080B034C
_080B0622:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B05BC
sub_080B05BC: @ 0x080B05BC
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B05DC @ =0x08CE6FC0
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #1
	bne _080B05E0
	b _080B05E6
	.align 2, 0
_080B05DC: .4byte 0x08CE6FC0
_080B05E0:
	ldr r0, [r7]
	bl sub_080B1AD8
_080B05E6:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

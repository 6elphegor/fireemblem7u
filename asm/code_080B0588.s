	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B0588
sub_080B0588: @ 0x080B0588
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	ldr r1, _080B05A8 @ =0x08CE6FC0
	adds r0, r1, #0
	bl Proc_Find
	str r0, [r7]
	ldr r1, [r7]
	adds r0, r1, #0
	adds r1, #0x60
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B05AC
	b _080B05B2
	.align 2, 0
_080B05A8: .4byte 0x08CE6FC0
_080B05AC:
	ldr r0, [r7]
	bl sub_080B18E8
_080B05B2:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0

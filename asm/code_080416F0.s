	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080416F0
sub_080416F0: @ 0x080416F0
	push {lr}
	adds r1, r0, #0
	ldr r0, _08041708 @ =0x0203D90C
	ldrb r0, [r0, #4]
	cmp r0, #0xff
	bne _08041704
	adds r0, r1, #0
	movs r1, #2
	bl Proc_Goto
_08041704:
	pop {r0}
	bx r0
	.align 2, 0
_08041708: .4byte 0x0203D90C

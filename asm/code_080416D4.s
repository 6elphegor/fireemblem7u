	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080416D4
sub_080416D4: @ 0x080416D4
	push {lr}
	adds r1, r0, #0
	ldr r0, _080416EC @ =0x0203D90C
	ldrb r0, [r0, #3]
	cmp r0, #0xff
	bne _080416E8
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_080416E8:
	pop {r0}
	bx r0
	.align 2, 0
_080416EC: .4byte 0x0203D90C

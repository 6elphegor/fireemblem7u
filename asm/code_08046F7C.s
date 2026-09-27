	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046F7C
sub_08046F7C: @ 0x08046F7C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046F94 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #1
	bne _08046F90
	adds r0, r1, #0
	movs r1, #1
	bl Proc_Goto
_08046F90:
	pop {r0}
	bx r0
	.align 2, 0
_08046F94: .4byte 0x0203D90C

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046D9C
sub_08046D9C: @ 0x08046D9C
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08046DBC @ =0x0203D90C
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046DBC: .4byte 0x0203D90C

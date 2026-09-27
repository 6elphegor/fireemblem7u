	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046BC4
sub_08046BC4: @ 0x08046BC4
	push {lr}
	ldr r2, _08046BD8 @ =0x0203DC9C
	ldrb r1, [r2, #8]
	cmp r1, #0
	bne _08046BDC
	strb r1, [r2, #9]
	movs r1, #0
	bl Proc_Goto
	b _08046BEE
	.align 2, 0
_08046BD8: .4byte 0x0203DC9C
_08046BDC:
	bl EndAllMus
	ldr r0, _08046BF4 @ =0x0202BBF8
	ldrb r1, [r0, #0xf]
	movs r0, #7
	movs r2, #0
	movs r3, #0
	bl sub_08044B98
_08046BEE:
	pop {r0}
	bx r0
	.align 2, 0
_08046BF4: .4byte 0x0202BBF8

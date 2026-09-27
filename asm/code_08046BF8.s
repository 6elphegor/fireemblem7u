	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046BF8
sub_08046BF8: @ 0x08046BF8
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08046C10 @ =0x0203DC9C
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08046C14
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b _08046C30
	.align 2, 0
_08046C10: .4byte 0x0203DC9C
_08046C14:
	bl EndAllMus
	bl EndAllMus
	ldr r1, _08046C38 @ =0x0203D90C
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08046C30:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08046C38: .4byte 0x0203D90C

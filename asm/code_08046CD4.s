	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046CD4
sub_08046CD4: @ 0x08046CD4
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08046CF4 @ =0x0203D90C
	ldrb r0, [r1]
	cmp r0, #1
	bne _08046CF8
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b _08046D0A
	.align 2, 0
_08046CF4: .4byte 0x0203D90C
_08046CF8:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl sub_08044B34
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
_08046D0A:
	pop {r4}
	pop {r0}
	bx r0

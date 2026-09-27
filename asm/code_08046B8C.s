	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08046B8C
sub_08046B8C: @ 0x08046B8C
	push {lr}
	adds r1, r0, #0
	ldr r0, _08046BA4 @ =0x0203DC9C
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _08046BA8
	adds r0, r1, #0
	movs r1, #0
	bl Proc_Goto
	b _08046BBA
	.align 2, 0
_08046BA4: .4byte 0x0203DC9C
_08046BA8:
	bl EndAllMus
	ldr r0, _08046BC0 @ =0x0202BBF8
	ldrb r1, [r0, #0xf]
	movs r0, #6
	movs r2, #0
	movs r3, #0
	bl sub_08044B98
_08046BBA:
	pop {r0}
	bx r0
	.align 2, 0
_08046BC0: .4byte 0x0202BBF8

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08047F1C
sub_08047F1C: @ 0x08047F1C
	push {lr}
	ldr r2, _08047F48 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	ldr r0, _08047F4C @ =0x08B9A3D0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08047F48: .4byte 0x03002870
_08047F4C: .4byte 0x08B9A3D0

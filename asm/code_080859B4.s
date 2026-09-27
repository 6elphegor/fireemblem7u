	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080859B4
sub_080859B4: @ 0x080859B4
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #6
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

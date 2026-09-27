	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A68A4
sub_080A68A4: @ 0x080A68A4
	push {lr}
	movs r1, #0
	str r1, [r0, #0x2c]
	adds r0, #0x30
	strb r1, [r0]
	movs r0, #0xf2
	lsls r0, r0, #3
	bl DecodeMsg
	bl SetTacticianName
	ldr r1, _080A68D8 @ =0x0202BBF8
	adds r2, r1, #0
	adds r2, #0x2b
	movs r0, #0xf
	ldrb r3, [r2]
	ands r0, r3
	strb r0, [r2]
	adds r1, #0x2c
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r2, [r1]
	ands r0, r2
	strb r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_080A68D8: .4byte 0x0202BBF8

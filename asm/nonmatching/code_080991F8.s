	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080991F8
sub_080991F8: @ 0x080991F8
	push {lr}
	adds r1, r0, #0
	cmp r1, #1
	beq _08099224
	cmp r1, #1
	bgt _0809920A
	cmp r1, #0
	beq _08099230
	b _08099238
_0809920A:
	cmp r1, #2
	beq _08099214
	cmp r1, #3
	beq _0809921A
	b _08099238
_08099214:
	bl sub_080992F4
	b _0809921E
_0809921A:
	bl sub_08099330
_0809921E:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0809923A
_08099224:
	ldr r0, _08099234 @ =0x0202BBF8
	adds r0, #0x2b
	ldrb r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _08099238
_08099230:
	movs r0, #1
	b _0809923A
	.align 2, 0
_08099234: .4byte 0x0202BBF8
_08099238:
	movs r0, #0
_0809923A:
	pop {r1}
	bx r1
	.align 2, 0

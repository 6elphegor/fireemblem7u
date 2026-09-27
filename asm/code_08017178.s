	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08017178
sub_08017178: @ 0x08017178
	adds r3, r0, #0
	cmp r1, #0
	bne _08017182
	movs r1, #0xff
	b _08017192
_08017182:
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080171AC @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08017192:
	ldr r0, _080171B0 @ =0x0202BBF8
	adds r0, #0x1c
	adds r0, r1, r0
	movs r2, #0
	ldr r1, [r3]
	ldrb r0, [r0]
	ldrb r1, [r1, #4]
	cmp r0, r1
	bne _080171A6
	movs r2, #1
_080171A6:
	adds r0, r2, #0
	bx lr
	.align 2, 0
_080171AC: .4byte 0x08BE222C
_080171B0: .4byte 0x0202BBF8

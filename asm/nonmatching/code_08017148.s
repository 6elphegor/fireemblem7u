	.include "macro.inc"

	.syntax unified

	thumb_func_start BreakItemSealForPid
BreakItemSealForPid: @ 0x08017148
	adds r2, r0, #0
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #0
	bne _08017156
	movs r1, #0xff
	b _08017166
_08017156:
	movs r0, #0xff
	ands r0, r2
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017170 @ =0x08BE222C
	adds r1, r1, r0
	ldrb r1, [r1, #7]
_08017166:
	ldr r0, _08017174 @ =0x0202BBF8
	adds r0, #0x1c
	adds r0, r1, r0
	strb r3, [r0]
	bx lr
	.align 2, 0
_08017170: .4byte 0x08BE222C
_08017174: .4byte 0x0202BBF8

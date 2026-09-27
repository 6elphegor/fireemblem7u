	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080791F0
sub_080791F0: @ 0x080791F0
	push {r4, lr}
	ldr r4, _08079208 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterEventInfo
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	beq _0807920C
	ldr r0, [r0, #0x10]
	b _0807920E
	.align 2, 0
_08079208: .4byte 0x0202BBF8
_0807920C:
	ldr r0, [r0, #0x14]
_0807920E:
	pop {r4}
	pop {r1}
	bx r1

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0802E864
sub_0802E864: @ 0x0802E864
	push {r4, lr}
	ldr r4, _0802E888 @ =0x0202BBF8
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	movs r1, #0
	ldrb r4, [r4, #0x1b]
	cmp r4, #3
	bne _0802E87A
	movs r1, #1
_0802E87A:
	adds r0, #0x86
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0802E88C
	movs r0, #1
	b _0802E88E
	.align 2, 0
_0802E888: .4byte 0x0202BBF8
_0802E88C:
	movs r0, #0
_0802E88E:
	pop {r4}
	pop {r1}
	bx r1

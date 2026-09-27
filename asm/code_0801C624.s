	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801C624
sub_0801C624: @ 0x0801C624
	push {lr}
	ldr r0, _0801C650 @ =0x0202BBF8
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C63A
	movs r0, #0xe2
	lsls r0, r0, #2
	bl m4aSongNumStart
_0801C63A:
	ldr r1, _0801C654 @ =0x0202BBB8
	movs r0, #0xfd
	ldrb r2, [r1, #4]
	ands r0, r2
	strb r0, [r1, #4]
	ldr r0, _0801C658 @ =0x03004690
	ldr r0, [r0]
	bl sub_0801C4D0
	pop {r0}
	bx r0
	.align 2, 0
_0801C650: .4byte 0x0202BBF8
_0801C654: .4byte 0x0202BBB8
_0801C658: .4byte 0x03004690

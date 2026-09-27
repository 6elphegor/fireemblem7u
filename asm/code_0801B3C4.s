	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801B3C4
sub_0801B3C4: @ 0x0801B3C4
	push {r4, lr}
	adds r4, r1, #0
	bl EndMapMain
	ldr r1, _0801B3E4 @ =0x0202BBF8
	adds r4, #0x3c
	ldrb r0, [r4]
	strb r0, [r1, #0xe]
	bl CleanupUnitsBeforeChapter
	bl sub_08012B88
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801B3E4: .4byte 0x0202BBF8

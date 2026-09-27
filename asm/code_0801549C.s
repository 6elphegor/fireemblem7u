	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0801549C
sub_0801549C: @ 0x0801549C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080154C0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterInfo
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	bne _080154BA
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_080154BA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080154C0: .4byte 0x0202BBF8

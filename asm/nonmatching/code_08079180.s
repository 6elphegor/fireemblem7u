	.include "macro.inc"

	.syntax unified

	thumb_func_start RunWaitEvents
RunWaitEvents: @ 0x08079180
	push {lr}
	sub sp, #0x1c
	ldr r0, _080791B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _080791BC @ =0x03004690
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl SearchAvailableEvent
	cmp r0, #0
	beq _080791B2
	mov r0, sp
	bl StartEventFromInfo
_080791B2:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0
_080791B8: .4byte 0x0202BBF8
_080791BC: .4byte 0x03004690

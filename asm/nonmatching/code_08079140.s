	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckForWaitEvents
CheckForWaitEvents: @ 0x08079140
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079170 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #0xc]
	str r0, [sp]
	mov r1, sp
	ldr r0, _08079174 @ =0x03004690
	ldr r2, [r0]
	ldrb r0, [r2, #0x10]
	strb r0, [r1, #0x18]
	ldrb r0, [r2, #0x11]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl SearchAvailableEvent
	cmp r0, #0
	bne _08079178
	movs r0, #0
	b _0807917A
	.align 2, 0
_08079170: .4byte 0x0202BBF8
_08079174: .4byte 0x03004690
_08079178:
	movs r0, #1
_0807917A:
	add sp, #0x1c
	pop {r1}
	bx r1

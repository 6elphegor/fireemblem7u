	.include "macro.inc"

	.syntax unified

	thumb_func_start CheckAvailableTurnEvent
CheckAvailableTurnEvent: @ 0x08078988
	push {lr}
	sub sp, #0x1c
	ldr r0, _080789AC @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	bne _080789B0
	movs r0, #0
	b _080789B2
	.align 2, 0
_080789AC: .4byte 0x0202BBF8
_080789B0:
	movs r0, #1
_080789B2:
	add sp, #0x1c
	pop {r1}
	bx r1

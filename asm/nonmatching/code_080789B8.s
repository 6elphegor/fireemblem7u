	.include "macro.inc"

	.syntax unified

	thumb_func_start StartAvailableTurnEvents
StartAvailableTurnEvents: @ 0x080789B8
	push {lr}
	sub sp, #0x1c
	ldr r0, _080789E0 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0]
	str r0, [sp]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _080789F4
	mov r0, sp
	bl sub_08078100
	b _080789EA
	.align 2, 0
_080789E0: .4byte 0x0202BBF8
_080789E4:
	mov r0, sp
	bl sub_08078100
_080789EA:
	mov r0, sp
	bl sub_08078180
	cmp r0, #0
	bne _080789E4
_080789F4:
	add sp, #0x1c
	pop {r0}
	bx r0
	.align 2, 0

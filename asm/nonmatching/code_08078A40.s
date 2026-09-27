	.include "macro.inc"

	.syntax unified

	thumb_func_start StartCharacterEvent
StartCharacterEvent: @ 0x08078A40
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078A7C @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl SearchAvailableEvent
	cmp r0, #0
	beq _08078A74
	mov r0, sp
	bl StartEventFromInfo
_08078A74:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08078A7C: .4byte 0x0202BBF8

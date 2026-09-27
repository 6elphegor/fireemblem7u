	.include "macro.inc"

	.syntax unified

	thumb_func_start GetAvailableTileEventCommand
GetAvailableTileEventCommand: @ 0x08078BD0
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078C04 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x18]
	strb r5, [r0, #0x19]
	bl sub_0807812C
	cmp r0, #0
	beq _08078C08
	ldr r0, [sp, #0xc]
	b _08078C0A
	.align 2, 0
_08078C04: .4byte 0x0202BBF8
_08078C08:
	movs r0, #0
_08078C0A:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

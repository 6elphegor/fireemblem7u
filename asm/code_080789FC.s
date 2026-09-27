	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080789FC
sub_080789FC: @ 0x080789FC
	push {r4, r5, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	lsls r5, r5, #0x18
	lsrs r5, r5, #0x18
	ldr r0, _08078A30 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #4]
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #0x1a]
	strb r5, [r0, #0x1b]
	bl sub_0807812C
	cmp r0, #0
	bne _08078A34
	movs r0, #0
	b _08078A36
	.align 2, 0
_08078A30: .4byte 0x0202BBF8
_08078A34:
	movs r0, #1
_08078A36:
	add sp, #0x1c
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08030EFC
sub_08030EFC: @ 0x08030EFC
	push {lr}
	sub sp, #0x1c
	ldr r0, _08030F34 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventInfo
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r1, sp
	ldr r2, _08030F38 @ =0x0202BBB8
	ldrh r0, [r2, #0x14]
	strb r0, [r1, #0x18]
	ldrh r0, [r2, #0x16]
	strb r0, [r1, #0x19]
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _08030F4E
	ldr r0, [sp, #0xc]
	cmp r0, #0x13
	beq _08030F3C
	cmp r0, #0x14
	beq _08030F46
	b _08030F4E
	.align 2, 0
_08030F34: .4byte 0x0202BBF8
_08030F38: .4byte 0x0202BBB8
_08030F3C:
	ldr r1, [sp, #4]
	movs r0, #0
	bl sub_080B03D4
	b _08030F4E
_08030F46:
	ldr r1, [sp, #4]
	movs r0, #0
	bl sub_080B03F4
_08030F4E:
	add sp, #0x1c
	pop {r0}
	bx r0

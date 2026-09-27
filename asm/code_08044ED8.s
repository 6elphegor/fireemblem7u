	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08044ED8
sub_08044ED8: @ 0x08044ED8
	push {r4, r5, lr}
	sub sp, #4
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r4, _08044F30 @ =0x0202BBB8
	ldr r2, _08044F34 @ =0x01000020
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	movs r0, #0x40
	movs r5, #0
	ldrb r1, [r4, #4]
	orrs r0, r1
	strb r0, [r4, #4]
	bl InitTraps
	ldr r4, _08044F38 @ =0x0202BBF8
	movs r0, #0x40
	strb r0, [r4, #0xf]
	movs r0, #0x41
	strb r0, [r4, #0xe]
	strh r5, [r4, #0x10]
	bl GetChapterInfo
	ldrb r0, [r0, #0xc]
	strb r0, [r4, #0xd]
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetChapterInfo
	ldrb r0, [r0, #0x12]
	strb r0, [r4, #0x15]
	movs r0, #0x41
	bl InitChapterMap
	bl GetGameTime
	str r0, [r4, #4]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08044F30: .4byte 0x0202BBB8
_08044F34: .4byte 0x01000020
_08044F38: .4byte 0x0202BBF8

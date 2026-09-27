	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08078FC8
sub_08078FC8: @ 0x08078FC8
	push {lr}
	sub sp, #0x1c
	ldr r0, _08078FFC @ =0x0202BBF8
	movs r1, #0xe
	ldrsb r1, [r0, r1]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	ldr r2, _08079000 @ =0x08C9EA2C
	lsls r0, r1, #4
	adds r0, r0, r2
	ldr r0, [r0]
	str r0, [sp]
	cmp r1, #0xb
	bhi _08078FF4
	mov r0, sp
	bl SearchAvailableEvent
	cmp r0, #0
	beq _08078FF4
	mov r0, sp
	bl StartEventFromInfo
_08078FF4:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_08078FFC: .4byte 0x0202BBF8
_08079000: .4byte 0x08C9EA2C

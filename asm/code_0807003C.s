	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807003C
sub_0807003C: @ 0x0807003C
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	ldr r1, _08070068 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1e
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _0807005E
	movs r1, #0xe5
	lsls r1, r1, #2
	adds r0, r1, #0
	bl m4aSongNumStart
_0807005E:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070068: .4byte 0x0202BBF8

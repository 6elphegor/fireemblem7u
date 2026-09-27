	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079104
sub_08079104: @ 0x08079104
	push {lr}
	sub sp, #0x1c
	ldr r0, _08079130 @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079134 @ =0x08C9EA2C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _08079138
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _08079138
	movs r0, #1
	b _0807913A
	.align 2, 0
_08079130: .4byte 0x0202BBF8
_08079134: .4byte 0x08C9EA2C
_08079138:
	movs r0, #0
_0807913A:
	add sp, #0x1c
	pop {r1}
	bx r1

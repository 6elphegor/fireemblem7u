	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807905C
sub_0807905C: @ 0x0807905C
	push {lr}
	sub sp, #0x1c
	ldr r0, _0807909C @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _080790A0 @ =0x08C9EA2C
	lsls r1, r2, #4
	adds r0, #4
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _080790AA
	mov r0, sp
	bl sub_0807812C
	cmp r0, #0
	beq _080790AA
	mov r0, sp
	bl sub_0807821C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080790A4
	mov r0, sp
	bl sub_08078100
	movs r0, #1
	b _080790AC
	.align 2, 0
_0807909C: .4byte 0x0202BBF8
_080790A0: .4byte 0x08C9EA2C
_080790A4:
	mov r0, sp
	bl sub_08078120
_080790AA:
	movs r0, #0
_080790AC:
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0

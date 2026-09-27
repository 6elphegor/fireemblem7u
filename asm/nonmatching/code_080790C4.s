	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080790C4
sub_080790C4: @ 0x080790C4
	push {lr}
	sub sp, #0x1c
	ldr r0, _080790FC @ =0x0202BBF8
	movs r2, #0xe
	ldrsb r2, [r0, r2]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	ldr r0, _08079100 @ =0x08C9EA2C
	lsls r1, r2, #4
	adds r0, #0xc
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r2, #0xb
	bhi _080790F2
	mov r0, sp
	bl SearchAvailableEvent
	cmp r0, #0
	beq _080790F2
	mov r0, sp
	bl StartEventFromInfo
_080790F2:
	movs r0, #0
	add sp, #0x1c
	pop {r1}
	bx r1
	.align 2, 0
_080790FC: .4byte 0x0202BBF8
_08079100: .4byte 0x08C9EA2C

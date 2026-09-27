	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080B2EB0
sub_080B2EB0: @ 0x080B2EB0
	push {r7, lr}
	sub sp, #4
	mov r7, sp
	str r0, [r7]
	bl ArenaGetResult
	cmp r0, #1
	beq _080B2EC2
	b _080B2EE0
_080B2EC2:
	ldr r1, _080B2EDC @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2EDA
	movs r0, #0x2d
	movs r1, #0
	bl StartBgmCore
_080B2EDA:
	b _080B2F04
	.align 2, 0
_080B2EDC: .4byte 0x0202BBF8
_080B2EE0:
	ldr r1, _080B2F00 @ =0x0202BBF8
	adds r0, r1, #0
	adds r1, #0x41
	ldrb r0, [r1]
	lsls r1, r0, #0x1f
	lsrs r0, r1, #0x1f
	cmp r0, #0
	bne _080B2EF8
	movs r0, #0x47
	movs r1, #0
	bl StartBgmCore
_080B2EF8:
	ldr r0, [r7]
	bl Proc_End
	b _080B2F04
	.align 2, 0
_080B2F00: .4byte 0x0202BBF8
_080B2F04:
	add sp, #4
	pop {r7}
	pop {r0}
	bx r0

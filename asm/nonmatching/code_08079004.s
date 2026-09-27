	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08079004
sub_08079004: @ 0x08079004
	push {r4, lr}
	sub sp, #0x1c
	ldr r0, _08079048 @ =0x0202BBF8
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0807904C @ =0x08C9EA2C
	lsls r1, r4, #4
	adds r0, #8
	adds r1, r1, r0
	ldr r0, [r1]
	str r0, [sp]
	cmp r4, #0xb
	bhi _08079050
	mov r0, sp
	bl SearchAvailableEvent
	cmp r0, #0
	beq _08079050
	mov r0, sp
	bl StartEventFromInfo
	cmp r4, #1
	bne _08079050
	bl sub_0807CEFC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08079050
	movs r0, #1
	b _08079052
	.align 2, 0
_08079048: .4byte 0x0202BBF8
_0807904C: .4byte 0x08C9EA2C
_08079050:
	movs r0, #0
_08079052:
	add sp, #0x1c
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
